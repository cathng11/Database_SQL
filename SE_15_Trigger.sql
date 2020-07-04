use SE_15

select * from SinhVien

select * from Khoa

select * from TaiKhoan

--Thay đổi số lượng sinh viên của khoa khi update thuộc tính khoa
create trigger SinhVien_UpdateKhoa
on SinhVien
for update
as
begin
	update Khoa set SoLuongSV = SoLuongSV - 1 where IDKhoa = (select IDKhoa from deleted)
	update Khoa set SoLuongSV = SoLuongSV + 1 where IDKhoa = (select IDKhoa from inserted)
end

update SinhVien set IDKhoa = 6 where IDSinhVien = 102180109
 select * from Khoa
 select * from SinhVien where IDSinhVien=102180109
--Khi xóa sinh viên sẽ xóa luôn tài khoản của sinh viên và giảm 1 SoLuongSV của Khoa
create trigger Khoa_GiamSoLuongSV
on SinhVien
for delete
as
begin
	update Khoa set SoLuongSV = SoLuongSV - 1 where IDKhoa = (select IDKhoa from deleted)
	delete from TaiKhoan where IDTaiKhoan = (select IDTaiKhoan from deleted)
end

--Khi sinh viên hủy đăng ký sẽ bị giảm điểm hoạt động, khi đăng ký lại thì điểm sẽ được cộng lại, SoLuongThamGia ở bảng HoatDong sẽ thay đổi theo
drop trigger DangKy_CapNhatDiemHD 
create trigger DangKy_CapNhatDiemHD
on DangKy
for update
as
begin
	declare @Kiemtradangky nvarchar(50)
	declare @Kiemtrahuy nvarchar(50)
	declare @IDSV nvarchar(50)
	declare @IDHD nvarchar(50)
	select @Kiemtrahuy = TrangThai, @IDSV = IDSinhVien, @IDHD = IDHoatDong from inserted
	select @Kiemtradangky = TrangThai from deleted

	if (@Kiemtrahuy = N'Hủy đăng ký' and @Kiemtradangky = N'Đã đăng ký')
	begin
		update SinhVien set TongDiemHoatDong = TongDiemHoatDong - (select DiemHD from HoatDong where IDHoatDong = @IDHD)
		where IDSinhVien = @IDSV
		update HoatDong set SoLuongThamGia = SoLuongThamGia - 1 where IDHoatDong = @IDHD
	end
	else if (@Kiemtrahuy = N'Đã đăng ký' and @Kiemtradangky = N'Hủy đăng ký')
	begin	
		update SinhVien set TongDiemHoatDong = TongDiemHoatDong + (select DiemHD from HoatDong where IDHoatDong = @IDHD)
		where IDSinhVien = @IDSV
		update HoatDong set SoLuongThamGia = SoLuongThamGia + 1 where IDHoatDong = @IDHD
	end
end

---------------------------------

select * from TaiKhoan
select * from SinhVien where IDSinhVien = 102180101
select * from HoatDong
update DangKy set TrangThai = N'Đã đăng ký' where IDDangKy = 12
update DangKy set TrangThai = N'Hủy đăng ký' where IDSinhVien = 102180101 and IDHoatDong='HD08'
update DangKy set TrangThai = N'Đã đăng ký' where IDSinhVien = 102180101 and IDHoatDong='HD08'