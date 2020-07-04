drop database SE_15
create database SE_15

use SE_15

create table LoaiTaiKhoan
(
	IDLoaiTaiKhoan nvarchar(50) primary key,
	TenLoai nvarchar(50) unique
)

create table TaiKhoan
(
	IDTaiKhoan nvarchar(50) primary key,
	TenDangNhap nvarchar(50) unique,
	MatKhau nvarchar(50),
	IDLoaiTaiKhoan nvarchar(50) foreign key references LoaiTaiKhoan
)

create table Admin
(
	IDAdmin int identity(1,1) primary key,
	TenAdmin nvarchar(50),
	IDTaiKhoan nvarchar(50) unique

	constraint fk_Admin_IDTaiKhoan
	foreign key (IDTaiKhoan)
	references TaiKhoan(IDTaiKhoan)
	on delete cascade
	on update cascade
)

create table Khoa
(
	IDKhoa int identity(1,1) primary key,
	TenKhoa nvarchar(50) unique,
	SoLuongSV int,
	IDTaiKhoan nvarchar(50) unique

	constraint fk_Khoa_IDTaiKhoan
	foreign key (IDTaiKhoan)
	references TaiKhoan(IDTaiKhoan)
	on delete cascade
	on update cascade
)

create table SinhVien
(
	IDSinhVien int identity(102180101,1) primary key,
	IDTaiKhoan nvarchar(50) unique,
	IDKhoa int foreign key references Khoa(IDKhoa),
	TenSinhVien nvarchar(255),
	GioiTinh bit,
	Email nvarchar(255) unique,
	SoDienThoai nvarchar(10) unique,
	QueQuan nvarchar(255),
	NgaySinh date,
	DiaChi nvarchar(255),
	TongDiemHoatDong int

	constraint fk_SinhVien_IDTaiKhoan
	foreign key (IDTaiKhoan)
	references TaiKhoan(IDTaiKhoan)
	on delete cascade
	on update cascade,
)

create table LoaiHoatDong
(
	IDLoaiHoatDong int identity(1,1) primary key,
	LoaiHoatDong nvarchar(50) unique
)

create table HoatDong
(
	IDHoatDong nvarchar(50) primary key,
	IDLoaiHoatDong int foreign key references LoaiHoatDong,
	IDKhoa int foreign key references Khoa,
	TenHoatDong nvarchar(100),
	SoLuongThamGia int,
	ThoiGian datetime,
	DiaDiem nvarchar(255),
	ChiPhi int,
	MoTa nvarchar(255),
	YeuCau nvarchar(255),
	DiemHD int,
	TrangThaiPheDuyet nvarchar(20) check (TrangThaiPheDuyet = N'Đã duyệt' or TrangThaiPheDuyet = N'Không duyệt'),
	TrangThaiDangKy nvarchar(20) check (TrangThaiDangKy = N'Mở đăng ký' or TrangThaiDangKy = N'Đóng đăng ký')
)
drop table DangKy
create table DangKy
(
	IDDangKy int identity(1,1) primary key,
	IDSinhVien int ,
	IDHoatDong nvarchar(50),
	ThoiGianDangKy datetime,
	ThoiGianHuyDangKy datetime,
	TrangThai nvarchar(50) check (TrangThai = N'Hủy đăng ký' or TrangThai = N'Đã đăng ký')

	constraint fk_DangKy_IDHoatDong
	foreign key (IDHoatDong)
	references  HoatDong(IDHoatDong)
	on delete cascade
	on update cascade,

	constraint fk_Dangky_IDSinhVien
	foreign key (IDSinhVien)
	references SinhVien(IDSinhVien)
	on delete cascade
	on update cascade
)

create table LichSuDangNhap
(
	IDLichSu int identity(1,1) primary key,
	IDTaiKhoan nvarchar(50) foreign key references TaiKhoan,
	ThoiGianDangNhap datetime

	constraint fk_LichSu_IDTaiKhoan
	foreign key (IDTaiKhoan)
	references TaiKhoan(IDTaiKhoan)
	on delete cascade
	on update cascade
)

insert into LoaiTaiKhoan values
('AD', 'Admin'),
('K', N'Khoa'),
('SV', N'Sinh viên')

insert into TaiKhoan values
('AD1', 'admin1', 'admin1', 'AD'),
('AD2', 'admin2', 'admin2', 'AD'),
('K1', 'congnghethongtin', 'congnghethongtin', 'K'),
('K2', 'congnghethucpham', 'congnghethucpham', 'K'),
('K3', 'quanlyduan', 'quanlyduan', 'K'),
('K4', 'hoa', 'hoa', 'K'),
('K5', 'dien', 'dien', 'K'),
('K6', 'cokhi', 'cokhi', 'K'),
('K7', 'dientuvienthong', 'dientuvienthong', 'K'),
('K8', 'congnghesinhhoc', 'congnghesinhhoc', 'K'),
('SV1', '102180101', '102180101', 'SV'),
('SV2', '102180102', '102180102', 'SV'),
('SV3', '102180103', '102180103', 'SV'),
('SV4', '102180104', '102180104', 'SV'),
('SV5', '102180105', '102180105', 'SV'),
('SV6', '102180106', '102180106', 'SV'),
('SV7', '102180107', '102180107', 'SV'),
('SV8', '102180108', '102180108', 'SV'),
('SV9', '102180109', '102180109', 'SV'),
('SV10', '102180110', '102180110', 'SV'),
('SV11', '102180111', '102180111', 'SV'),
('SV12', '102180112', '102180112', 'SV'),
('SV13', '102180113', '102180113', 'SV'),
('SV14', '102180114', '102180114', 'SV'),
('SV15', '102180115', '102180115', 'SV'),
('SV16', '102180116', '102180116', 'SV')

insert into Admin values
('Phan Duy Kha', 'AD1'),
('Nguyễn Thị Hạ Vinh', 'AD2')

insert into Khoa values (N'Công nghệ thông tin', 0, 'K1')
insert into Khoa values (N'Công nghệ thực phẩm', 0, 'K2')
insert into Khoa values (N'Quản lý dự án', 0, 'K3')
insert into Khoa values (N'Hoá', 0, 'K4')
insert into Khoa values (N'Điện', 0, 'K5')
insert into Khoa values (N'Cơ khí', 0, 'K6')
insert into Khoa values (N'Điện tử viễn thông', 0, 'K7')
insert into Khoa values (N'Công nghệ sinh học', 0, 'K8')

select * from TaiKhoan

--Tự động cập nhật số lượng SV khi thêm 1 SV mới thuộc khoa
create trigger Khoa_UpdateSoLuongSV
on SinhVien
for insert
as
begin
	update Khoa set SoLuongSV = SoLuongSV + 1 where IDKhoa = (select IDKhoa from inserted)
end

insert into SinhVien values ('SV1', 1, N'Nguyễn Văn A', 1, 'nguyenvana@email.com', '0905002001', N'Đà Nẵng', '20000202', N'Tổ 1 Thanh Khê', 0)
insert into SinhVien values ('SV2', 2, N'Phạm Văn B', 0, 'phamvanb@email.com', '0905002002', N'Thanh Khê', '20000202', N'Tổ 1 Thanh Khê', 0)
insert into SinhVien values ('SV3', 3, N'Tôn Thất C', 0, 'tonthatquac@email.com', '0905002003', N'Sơn Trà', '20000202', N'Tổ 1 Sơn Trà', 0)
insert into SinhVien values ('SV4', 4, N'Phan Ngọc D', 0, 'dngocphand@email.com', '0905002004', N'Hải Châu', '20000202', N'Tổ 1 Hải Châu', 0)
insert into SinhVien values ('SV5', 5, N'Hoàng Hải E', 1, 'haihoangne@email.com', '0905002005', N'Cẩm Lệ', '20000202', N'Tổ 1 Cẩm Lệ', 0)
insert into SinhVien values ('SV6', 6, N'Nguyễn Văn F', 0, 'nguyenvanf@email.com', '0905002006', N'Liên Chiểu', '20000202', N'Tổ 1 Liên Chiểu', 0)
insert into SinhVien values ('SV7', 7, N'Nguyễn Thị G', 1, 'nguyenthigg@email.com', '0905002007', N'Ngũ Hành Sơn', '20000202', N'Tổ 1 Ngũ Hành Sơn', 0)
insert into SinhVien values ('SV8', 8, N'Taylor Swift', 1, 'taylorswift@email.com', '0905002008', N'Ngũ Hành Sơn', '20000202', N'Tổ 2 Ngũ Hành Sơn', 0)
insert into SinhVien values ('SV9', 1, N'Shawn Mendes', 1, 'shawn@email.com', '0905002009', N'Đà Nẵng', '20000202', N'Tổ 2 Thanh Khê', 0)
insert into SinhVien values ('SV10', 2, N'Selena Gomez', 0, 'selena@email.com', '0905002010', N'Thanh Khê', '20000202', N'Tổ 2 Thanh Khê', 0)
insert into SinhVien values ('SV11', 3, N'Cardi B', 0, 'cardi@email.com', '0905002011', N'Sơn Trà', '20000202', N'Tổ 3 Sơn Trà', 0)
insert into SinhVien values ('SV12', 4, N'Justin Bieber', 0, 'justin@email.com', '0905002012', N'Hải Châu', '20000202', N'Tổ 11 Hải Châu', 0)
insert into SinhVien values ('SV13', 5, N'GiGi Hadrid', 1, 'gigi@email.com', '0905002013', N'Cẩm Lệ', '20000202', N'Tổ 13 Cẩm Lệ', 0)
insert into SinhVien values ('SV14', 6, N'Zayn Malik', 0, 'zayn@email.com', '0905002014', N'Liên Chiểu', '20000202', N'Tổ 21 Liên Chiểu', 0)
insert into SinhVien values ('SV15', 7, N'Angelina Jolie', 1, 'angelina@email.com', '0905002015', N'Ngũ Hành Sơn', '20000202', N'Tổ 11 Ngũ Hành Sơn', 0)
insert into SinhVien values ('SV16', 8, N'Eminem', 1, 'eminem@email.com', '0905002016', N'Ngũ Hành Sơn', '20000202', N'Tổ 32 Ngũ Hành Sơn', 0)



insert into LoaiHoatDong values
(N'Trại'),
(N'Hội thảo'),
(N'Trò chơi lớn'),
(N'Văn nghệ'),
(N'Thể thao'),
(N'Thực tập'),
(N'Kiến tập'),
(N'Tham quan')

insert into HoatDong values
('HD01', 1, 1, N'Trại truyền thống', 0, '20200204', N'Bãi biển Sơn Trà', 0, N'Mô tả hoạt động 1', N'Yêu cầu hoạt động', 5, N'Đã duyệt', N'Mở đăng ký'),
('HD02', 4, 2, N'Văn nghệ 20-11', 0, '20200205', N'Trường Bách Khoa', 0, N'Mô tả hoạt động 2', N'Yêu cầu hoạt động', 5, N'Đã duyệt', N'Mở đăng ký'),
('HD03', 2, 3, N'Hội thảo tiêu dùng', 0, '20200206', N'Novotel', 0, N'Mô tả hoạt động 3', N'Yêu cầu hoạt động', 5, N'Đã duyệt', N'Mở đăng ký'),
('HD04', 2, 4, N'Hội thảo du học', 0, '20200207', N'Sân trường', 0, N'Mô tả hoạt động 4', N'Yêu cầu hoạt động', 5, N'Đã duyệt', N'Mở đăng ký'),
('HD05', 3, 5, N'Kéo co', 0, '20200208', N'Sân trường', 0, N'Mô tả hoạt động 5', N'Yêu cầu hoạt động', 5, N'Đã duyệt', N'Mở đăng ký'),
('HD06', 8, 5, N'Tham quan nhà máy điện', 0, '20200204', N'Bãi biển Sơn Trà', 0, N'Mô tả hoạt động 1', N'Yêu cầu hoạt động', 5, N'Không duyệt', N'Đóng đăng ký'),
('HD07', 5, 6, N'Hội khoẻ phù đổng', 0, '20200204', N'Bãi biển Sơn Trà', 0, N'Mô tả hoạt động 1', N'Yêu cầu hoạt động', 5, N'Không duyệt', N'Đóng đăng ký'),
('HD08', 1, 1, N'Trại truyền thống', 0, '20200204', N'Bãi biển Sơn Trà', 0, N'Mô tả hoạt động 1', N'Yêu cầu hoạt động', 5, null, null),
('HD09', 4, 2, N'Văn nghệ 20-11', 0, '20200205', N'Trường Bách Khoa', 0, N'Mô tả hoạt động 2', N'Yêu cầu hoạt động', 5, null, null),
('HD10', 2, 3, N'Hội thảo tiêu dùng', 0, '20200206', N'Novotel', 0, N'Mô tả hoạt động 3', N'Yêu cầu hoạt động', 5, null, null),
('HD11', 2, 4, N'Hội thảo du học', 0, '20200207', N'Sân trường', 0, N'Mô tả hoạt động 4', N'Yêu cầu hoạt động', 5, null, null),
('HD12', 3, 5, N'Kéo co', 0, '20200208', N'Sân trường', 0, N'Mô tả hoạt động 5', N'Yêu cầu hoạt động', 5, null, null),
('HD13', 8, 5, N'Tham quan nhà máy điện', 0, '20200204', N'Bãi biển Sơn Trà', 0, N'Mô tả hoạt động 1', N'Yêu cầu hoạt động', 5, null, null),
('HD14', 5, 6, N'Hội khoẻ phù đổng', 0, '20200204', N'Bãi biển Sơn Trà', 0, N'Mô tả hoạt động 1', N'Yêu cầu hoạt động', 5, null, null)

create trigger HoatDong_UpdateSLThamGia
on DangKy
for insert
as
begin
	declare @diem int
	declare @idhd nchar(50)
	select @idhd = IDHoatDong from inserted
	select @diem = DiemHD from HoatDong where IDHoatDong = @idhd
	update HoatDong set SoLuongThamGia = SoLuongThamGia + 1 where IDHoatDong = @idhd 
	update SinhVien set TongDiemHoatDong = TongDiemHoatDong + @diem where IDSinhVien = (select IDSinhVien from inserted)
end


insert into DangKy values ( 102180101, 'HD01', '20200205',null, N'Đã đăng ký')
insert into DangKy values ( 102180101, 'HD08', '20200205',null, N'Đã đăng ký')
insert into DangKy values ( 102180102, 'HD02', '20200205',null, N'Đã đăng ký')
insert into DangKy values ( 102180110, 'HD09', '20200205',null, N'Đã đăng ký')
insert into DangKy values ( 102180103, 'HD03', '20200205',null, N'Đã đăng ký')
insert into DangKy values ( 102180111, 'HD10', '20200205',null, N'Đã đăng ký')
insert into DangKy values ( 102180104, 'HD04', '20200205',null, N'Đã đăng ký')
insert into DangKy values ( 102180112, 'HD11', '20200205',null, N'Đã đăng ký')
insert into DangKy values ( 102180105, 'HD05', '20200205',null, N'Đã đăng ký')
insert into DangKy values ( 102180113, 'HD12', '20200205','20200206', N'Hủy đăng ký')
insert into DangKy values ( 102180106, 'HD06', '20200205','20200206', N'Hủy đăng ký')
insert into DangKy values ( 102180114, 'HD13', '20200205','20200206', N'Hủy đăng ký')
insert into DangKy values ( 102180107, 'HD07', '20200205','20200206', N'Hủy đăng ký')
insert into DangKy values ( 102180115, 'HD14', '20200205','20200206', N'Hủy đăng ký')
insert into DangKy values ( 102180109, 'HD01', '20200205','20200206', N'Hủy đăng ký')
insert into DangKy values ( 102180109, 'HD08', '20200205',null, N'Đã đăng ký')



insert into LichSuDangNhap values ('SV1',convert(datetime,'2020-04-21 12:22:11',120))
insert into LichSuDangNhap values ('SV2',convert(datetime,'2020-04-22 12:22:11',120))
insert into LichSuDangNhap values ('SV3',convert(datetime,'2020-04-23 12:22:11',120))
insert into LichSuDangNhap values ('SV4',convert(datetime,'2020-04-24 12:22:11',120))
insert into LichSuDangNhap values ('SV5',convert(datetime,'2020-04-25 12:22:11',120))
insert into LichSuDangNhap values ('SV6',convert(datetime,'2020-04-26 12:22:11',120))
insert into LichSuDangNhap values ('SV7',convert(datetime,'2020-04-27 12:22:11',120))
insert into LichSuDangNhap values ('SV8',convert(datetime,'2020-04-28 12:22:11',120))

drop trigger trigger_HoatDong
create trigger trigger_HoatDong on HoatDong 
after insert as
begin
	Update SinhVien
	set TongDiemHoatDong=TongDiemHoatDong+(
	select DiemHD from inserted inner join DangKy 
	on DangKy.IDSinhVien=IDSinhVien 
	where DangKy.IDHoatDong=inserted.IDHoatDong )
	from SinhVien
end

drop trigger trigger_HuyDK_HD
create trigger trigger_HuyDK_HD on DangKy
after update as
begin 

	Declare @diem int;
	set @diem=(select DiemHD from HoatDong hd
	inner join inserted i on hd.IDHoatDong=i.IDHoatDong 
	where hd.IDHoatDong=i.IDHoatDong)

	 if exists (select * from inserted i where i.TrangThai=N'Huỷ đăng ký' )
	 begin 
	 	Update SinhVien  set TongDiemHoatDong=(TongDiemHoatDong-@diem) 
		from SinhVien sv
		inner join inserted dk on sv.IDSinhVien=dk.IDSinhVien
		inner join HoatDong hd on hd.IDHoatDong=dk.IDHoatDong
		where IDDangKy=dk.IDDangKy and dk.TrangThai=N'Huỷ đăng ký' 
	 end
	 else
	 begin
	 	 Update SinhVien  set TongDiemHoatDong=(TongDiemHoatDong+@diem) 
		from SinhVien sv
		inner join inserted dk on sv.IDSinhVien=dk.IDSinhVien
		inner join HoatDong hd on hd.IDHoatDong=dk.IDHoatDong
		where IDDangKy=dk.IDDangKy and dk.TrangThai=N'Đã đăng ký' 
	 end
end

	Update SinhVien set TongDiemHoatDong=TongDiemHoatDong-(select DiemHD from HoatDong where IDHoatDong='HD01')
	from SinhVien sv
	inner join DangKy dk on sv.IDSinhVien=dk.IDSinhVien
	inner join HoatDong hd on hd.IDHoatDong=dk.IDHoatDong
	where sv.IDSinhVien='102180101' and dk.TrangThai=N'Huỷ đăng ký'
delete from DangKy
select * from TaiKhoan
select * from SinhVien where IDSinhVien='102180114'
select * from DangKy where IDSinhVien='102180101' and IDHoatDong='HD01'
delete from DangKy
insert into DangKy values ( 102180116, 'HD08', '20200205',null, N'Đã đăng ký')
update DangKy set TrangThai=N'Đã đăng ký' where IDSinhVien='102180101' and IDHoatDong='HD01'

update DangKy set TrangThai=N'Đã đăng ký' where IDSinhVien='102180114' and  IDHoatDong='HD08'

update TaiKhoan set MatKhau = 'YWRtaW4x' where IDTaiKhoan = 'AD1'
update TaiKhoan set MatKhau = 'YWRtaW4y' where IDTaiKhoan = 'AD2'

update TaiKhoan set MatKhau = 'Y29uZ25naGV0aG9uZ3Rpbg==' where IDTaiKhoan = 'K1'
update TaiKhoan set MatKhau = 'Y29uZ25naGV0aHVjcGhhbQ==' where IDTaiKhoan = 'K2'
update TaiKhoan set MatKhau = 'cXVhbmx5ZHVhbg==' where IDTaiKhoan = 'K3'
update TaiKhoan set MatKhau = 'aG9h' where IDTaiKhoan = 'K4'
update TaiKhoan set MatKhau = 'ZGllbg==' where IDTaiKhoan = 'K5'
update TaiKhoan set MatKhau = 'Y29raGk=' where IDTaiKhoan = 'K6'
update TaiKhoan set MatKhau = 'ZGllbnR1dmllbnRob25n==' where IDTaiKhoan = 'K7'
update TaiKhoan set MatKhau = 'Y29uZ25naGVzaW5oaG9j=' where IDTaiKhoan = 'K8'

update TaiKhoan set MatKhau = 'MTAyMTgwMTAx' where IDTaiKhoan = 'SV1'
update TaiKhoan set MatKhau = 'MTAyMTgwMTAx' where IDTaiKhoan = 'SV2'
update TaiKhoan set MatKhau = 'MTAyMTgwMTAz' where IDTaiKhoan = 'SV3'
update TaiKhoan set MatKhau = 'MTAyMTgwMTA0' where IDTaiKhoan = 'SV4'
update TaiKhoan set MatKhau = 'MTAyMTgwMTA1' where IDTaiKhoan = 'SV5'
update TaiKhoan set MatKhau = 'MTAyMTgwMTA2' where IDTaiKhoan = 'SV6'
update TaiKhoan set MatKhau = 'MTAyMTgwMTA3' where IDTaiKhoan = 'SV7'
update TaiKhoan set MatKhau = 'MTAyMTgwMTA4' where IDTaiKhoan = 'SV8'
update TaiKhoan set MatKhau = 'MTAyMTgwMTA5' where IDTaiKhoan = 'SV9'
update TaiKhoan set MatKhau = 'MTAyMTgwMTEw' where IDTaiKhoan = 'SV10'
update TaiKhoan set MatKhau = 'MTAyMTgwMTEx' where IDTaiKhoan = 'SV11'
update TaiKhoan set MatKhau = 'MTAyMTgwMTEy' where IDTaiKhoan = 'SV12'
update TaiKhoan set MatKhau = 'MTAyMTgwMTEz' where IDTaiKhoan = 'SV13'
update TaiKhoan set MatKhau = 'MTAyMTgwMTE0' where IDTaiKhoan = 'SV14'
update TaiKhoan set MatKhau = 'MTAyMTgwMTE1' where IDTaiKhoan = 'SV15'
update TaiKhoan set MatKhau = 'MTAyMTgwMTE2' where IDTaiKhoan = 'SV16'