create database dbRapChieuPhim

use dbRapChieuPhim

create table PHONGCHIEU(
MSPhong char(10) primary key,
TenPhong nvarchar(50),
SoLuongGhe int)

create table BOPHIM(
MSPhim char(10) primary key,
TenPhim nvarchar(50),
TheLoaiPhim nvarchar(50),
ThoiLuongPhim int,
DinhDangPhim nvarchar(50),
TrangThaiPhim nvarchar(50))

create table LICHCHIEU(
MSLich char(10) primary key,
MSPhong char(10) foreign key (MSPhong) references PHONGCHIEU,
MSPhim char(10) foreign key (MSPhim) references BOPHIM,
NgayChieuPhim date,
GioChieuPhim time)

create table VEPHIM(
MSGhe char(10) primary key,
MSLich char(10) foreign key (MSLich) references LICHCHIEU,
DinhDangVe nvarchar(50),
LoaiVe nvarchar(50),
GiaVe int)

insert into PHONGCHIEU values
('PC001','2D',40),
('PC002','2D',45),
('PC003','3D',40),
('PC004','3D',45),
('PC005','IMAX',30);

insert into BOPHIM values
('BP001','Man of Men','Hai',116,'2D','Dang chieu'),
('BP002','Last Christmas','Hai, Lang man',103,'2D','Dang chieu'),
('BP003','In The Trap','Ly ki, Kinh di',88,'2D','Dang chieu'),
('BP004','Knives Out','Hai, Toi pham',130,'2D','Dang chieu'),
('BP005','The Aeronauts','Phieu luu',101,'3D','Dang chieu'),
('BP006','21 Bridges','Toi pham, Hanh dong',109,'3D','Dang chieu'),
('BP007','Frozen','Hoat hinh',103,'IMAX','Dang chieu'),
('BP008','Black Christmas','Ly ki, Kinh di',100,'2D','Sap chieu'),
('BP009','Mat Biec','Tinh cam',117,'3D','Sap chieu'),
('BP010','No Time To Die','Phieu luu, ly ki',134,'IMAX','Sap chieu');

insert into LICHCHIEU values
('LC001','PC001','BP001',convert(date,'2019-12-08',120),convert(time,'09:30')),
('LC002','PC002','BP002',convert(date,'2019-12-07',120),convert(time,'15:30')),
('LC003','PC001','BP003',convert(date,'2019-12-07',120),convert(time,'20:20')),
('LC004','PC002','BP004',convert(date,'2019-12-09',120),convert(time,'11:15')),
('LC005','PC003','BP005',convert(date,'2019-12-08',120),convert(time,'07:00')),
('LC006','PC004','BP006',convert(date,'2019-12-19',120),convert(time,'13:30')),
('LC007','PC004','BP006',convert(date,'2019-12-28',120),convert(time,'19:00')),
('LC008','PC005','BP007',convert(date,'2019-12-15',120),convert(time,'08:45')),
('LC009','PC005','BP007',convert(date,'2019-12-11',120),convert(time,'22:15'));

insert into VEPHIM values
('GA001','LC001','2D','HS-SV',45000),
('GA002','LC001','2D','Nguoi lon',55000),
('GB001','LC002','2D','Nguoi gia',45000),
('GB002','LC004','2D','VIP',45000),
('GC001','LC005','3D','HS-SV',70000),
('GC002','LC005','3D','VIP',80000),
('GD001','LC006','3D','Nguoi lon',75000),
('GD002','LC007','3D','VIP',80000),
('GD003','LC007','3D','Tre em',60000),
('GE001','LC008','IMAX','HS-SV',10000),
('GE002','LC008','2D','Nguoi lon',11000),
('GE003','LC009','2D','VIP',12000),
('GE004','LC009','2D','Tre em',90000);

