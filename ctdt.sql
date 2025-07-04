USE [QLChuongTrinhDaoTao]
GO
/****** Object:  Table [dbo].[ChiTiet_CTDT]    Script Date: 22/06/2025 10:19:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTiet_CTDT](
	[MaChuongTrinh] [varchar](10) NOT NULL,
	[MaMonHoc] [varchar](15) NOT NULL,
	[KyHoc] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaChuongTrinh] ASC,
	[MaMonHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChuongTrinhDaoTao]    Script Date: 22/06/2025 10:19:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChuongTrinhDaoTao](
	[MaChuongTrinh] [varchar](10) NOT NULL,
	[TenChuongTrinh] [nvarchar](100) NOT NULL,
	[MaNganh] [varchar](10) NULL,
	[TrinhDoDaoTao] [nvarchar](50) NULL,
	[HinhThucDaoTao] [nvarchar](50) NULL,
	[NamApDung] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaChuongTrinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_ChuongTrinhDaoTao] UNIQUE NONCLUSTERED 
(
	[TrinhDoDaoTao] ASC,
	[HinhThucDaoTao] ASC,
	[MaNganh] ASC,
	[NamApDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GiangVien]    Script Date: 22/06/2025 10:19:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiangVien](
	[MaGiangVien] [varchar](10) NOT NULL,
	[HoTen] [nvarchar](100) NOT NULL,
	[MaKhoa] [varchar](10) NOT NULL,
	[Email] [varchar](100) NULL,
	[NgaySinh] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaGiangVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_GiangVien_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GiangVien_MonHoc]    Script Date: 22/06/2025 10:19:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiangVien_MonHoc](
	[MaGiangVien] [varchar](10) NOT NULL,
	[MaMonHoc] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaGiangVien] ASC,
	[MaMonHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Khoa]    Script Date: 22/06/2025 10:19:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Khoa](
	[MaKhoa] [varchar](10) NOT NULL,
	[TenKhoa] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKhoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhoiKienThuc]    Script Date: 22/06/2025 10:19:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhoiKienThuc](
	[MaKhoiKienThuc] [varchar](10) NOT NULL,
	[TenKhoiKienThuc] [nvarchar](100) NOT NULL,
	[ParentID] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKhoiKienThuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MonHoc]    Script Date: 22/06/2025 10:19:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonHoc](
	[MaMonHoc] [varchar](15) NOT NULL,
	[TenMonHoc] [nvarchar](100) NOT NULL,
	[SoTinChi] [float] NOT NULL,
	[SoTietLiThuyet] [int] NULL,
	[SoTietBaiTap] [int] NULL,
	[SoTietThucHanh] [int] NULL,
	[SoTietTuHoc] [int] NULL,
	[NgonNguDay] [nvarchar](50) NULL,
	[LoaiMon] [nvarchar](50) NULL,
	[MaKhoiKienThuc] [varchar](10) NULL,
	[MaMonHocTruoc] [varchar](15) NULL,
	[MaMonHocTienQuyet] [varchar](15) NULL,
	[MaMonHocSongHanh] [varchar](15) NULL,
	[TenMonHocTiengAnh] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaMonHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nganh]    Script Date: 22/06/2025 10:19:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nganh](
	[MaNganh] [varchar](10) NOT NULL,
	[MaKhoa] [varchar](10) NOT NULL,
	[TenNganh] [nvarchar](100) NOT NULL,
	[MoTa] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNganh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SinhVien]    Script Date: 22/06/2025 10:19:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SinhVien](
	[MaSinhVien] [varchar](10) NOT NULL,
	[HoTen] [nvarchar](100) NOT NULL,
	[NgaySinh] [date] NULL,
	[MaNganh] [varchar](10) NOT NULL,
	[NamNhapHoc] [int] NOT NULL,
	[Email] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSinhVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_SinhVien_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 22/06/2025 10:19:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [varchar](10) NOT NULL,
	[TenDangNhap] [varchar](50) NOT NULL,
	[MatKhau] [nvarchar](100) NOT NULL,
	[Quyen] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_User_TenDangNhap] UNIQUE NONCLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ChiTiet_CTDT]  WITH CHECK ADD FOREIGN KEY([MaChuongTrinh])
REFERENCES [dbo].[ChuongTrinhDaoTao] ([MaChuongTrinh])
GO
ALTER TABLE [dbo].[ChiTiet_CTDT]  WITH CHECK ADD FOREIGN KEY([MaChuongTrinh])
REFERENCES [dbo].[ChuongTrinhDaoTao] ([MaChuongTrinh])
GO
ALTER TABLE [dbo].[ChiTiet_CTDT]  WITH CHECK ADD FOREIGN KEY([MaMonHoc])
REFERENCES [dbo].[MonHoc] ([MaMonHoc])
GO
ALTER TABLE [dbo].[ChiTiet_CTDT]  WITH CHECK ADD FOREIGN KEY([MaMonHoc])
REFERENCES [dbo].[MonHoc] ([MaMonHoc])
GO
ALTER TABLE [dbo].[ChuongTrinhDaoTao]  WITH CHECK ADD FOREIGN KEY([MaNganh])
REFERENCES [dbo].[Nganh] ([MaNganh])
GO
ALTER TABLE [dbo].[ChuongTrinhDaoTao]  WITH CHECK ADD FOREIGN KEY([MaNganh])
REFERENCES [dbo].[Nganh] ([MaNganh])
GO
ALTER TABLE [dbo].[GiangVien]  WITH CHECK ADD FOREIGN KEY([MaKhoa])
REFERENCES [dbo].[Khoa] ([MaKhoa])
GO
ALTER TABLE [dbo].[GiangVien]  WITH CHECK ADD FOREIGN KEY([MaKhoa])
REFERENCES [dbo].[Khoa] ([MaKhoa])
GO
ALTER TABLE [dbo].[GiangVien_MonHoc]  WITH CHECK ADD FOREIGN KEY([MaGiangVien])
REFERENCES [dbo].[GiangVien] ([MaGiangVien])
GO
ALTER TABLE [dbo].[GiangVien_MonHoc]  WITH CHECK ADD FOREIGN KEY([MaGiangVien])
REFERENCES [dbo].[GiangVien] ([MaGiangVien])
GO
ALTER TABLE [dbo].[GiangVien_MonHoc]  WITH CHECK ADD FOREIGN KEY([MaMonHoc])
REFERENCES [dbo].[MonHoc] ([MaMonHoc])
GO
ALTER TABLE [dbo].[GiangVien_MonHoc]  WITH CHECK ADD FOREIGN KEY([MaMonHoc])
REFERENCES [dbo].[MonHoc] ([MaMonHoc])
GO
ALTER TABLE [dbo].[KhoiKienThuc]  WITH CHECK ADD FOREIGN KEY([ParentID])
REFERENCES [dbo].[KhoiKienThuc] ([MaKhoiKienThuc])
GO
ALTER TABLE [dbo].[KhoiKienThuc]  WITH CHECK ADD FOREIGN KEY([ParentID])
REFERENCES [dbo].[KhoiKienThuc] ([MaKhoiKienThuc])
GO
ALTER TABLE [dbo].[MonHoc]  WITH CHECK ADD FOREIGN KEY([MaKhoiKienThuc])
REFERENCES [dbo].[KhoiKienThuc] ([MaKhoiKienThuc])
GO
ALTER TABLE [dbo].[MonHoc]  WITH CHECK ADD FOREIGN KEY([MaKhoiKienThuc])
REFERENCES [dbo].[KhoiKienThuc] ([MaKhoiKienThuc])
GO
ALTER TABLE [dbo].[MonHoc]  WITH CHECK ADD FOREIGN KEY([MaMonHocTruoc])
REFERENCES [dbo].[MonHoc] ([MaMonHoc])
GO
ALTER TABLE [dbo].[MonHoc]  WITH CHECK ADD FOREIGN KEY([MaMonHocTienQuyet])
REFERENCES [dbo].[MonHoc] ([MaMonHoc])
GO
ALTER TABLE [dbo].[MonHoc]  WITH CHECK ADD FOREIGN KEY([MaMonHocSongHanh])
REFERENCES [dbo].[MonHoc] ([MaMonHoc])
GO
ALTER TABLE [dbo].[MonHoc]  WITH CHECK ADD FOREIGN KEY([MaMonHocTruoc])
REFERENCES [dbo].[MonHoc] ([MaMonHoc])
GO
ALTER TABLE [dbo].[MonHoc]  WITH CHECK ADD FOREIGN KEY([MaMonHocTienQuyet])
REFERENCES [dbo].[MonHoc] ([MaMonHoc])
GO
ALTER TABLE [dbo].[MonHoc]  WITH CHECK ADD FOREIGN KEY([MaMonHocSongHanh])
REFERENCES [dbo].[MonHoc] ([MaMonHoc])
GO
ALTER TABLE [dbo].[Nganh]  WITH CHECK ADD FOREIGN KEY([MaKhoa])
REFERENCES [dbo].[Khoa] ([MaKhoa])
GO
ALTER TABLE [dbo].[Nganh]  WITH CHECK ADD FOREIGN KEY([MaKhoa])
REFERENCES [dbo].[Khoa] ([MaKhoa])
GO
ALTER TABLE [dbo].[SinhVien]  WITH CHECK ADD FOREIGN KEY([MaNganh])
REFERENCES [dbo].[Nganh] ([MaNganh])
GO
ALTER TABLE [dbo].[SinhVien]  WITH CHECK ADD FOREIGN KEY([MaNganh])
REFERENCES [dbo].[Nganh] ([MaNganh])
GO
ALTER TABLE [dbo].[MonHoc]  WITH CHECK ADD  CONSTRAINT [CHK_LoaiMon] CHECK  (([LoaiMon]=N'Thay thế tốt nghiệp' OR [LoaiMon]=N'Tự chọn' OR [LoaiMon]=N'Bắt buộc'))
GO
ALTER TABLE [dbo].[MonHoc] CHECK CONSTRAINT [CHK_LoaiMon]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [CHK_Quyen] CHECK  (([Quyen]=N'Sinh viên' OR [Quyen]=N'Giảng viên' OR [Quyen]=N'Phòng đào tạo'))
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [CHK_Quyen]
GO
/****** Object:  StoredProcedure [dbo].[SP_CapNhatHocKyMonHoc]    Script Date: 22/06/2025 10:19:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_CapNhatHocKyMonHoc]
    @MaChuongTrinh VARCHAR(10),
    @MaMonHoc VARCHAR(15),
    @KyHocMoi NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        UPDATE ChiTiet_CTDT
        SET KyHoc = @KyHocMoi
        WHERE MaChuongTrinh = @MaChuongTrinh 
        AND MaMonHoc = @MaMonHoc;

        -- Trả về thông tin đã cập nhật
        SELECT 
            ct.MaChuongTrinh,
            ct.MaMonHoc,
            mh.TenMonHoc,
            mh.SoTinChi,
            ct.KyHoc,
            mh.MaKhoiKienThuc,
            kkt.TenKhoiKienThuc,
            mh.MaMonHocTienQuyet,
            mhtq.TenMonHoc AS TenMonHocTienQuyet
        FROM ChiTiet_CTDT ct
        INNER JOIN MonHoc mh ON ct.MaMonHoc = mh.MaMonHoc
        LEFT JOIN KhoiKienThuc kkt ON mh.MaKhoiKienThuc = kkt.MaKhoiKienThuc
        LEFT JOIN MonHoc mhtq ON mh.MaMonHocTienQuyet = mhtq.MaMonHoc
        WHERE ct.MaChuongTrinh = @MaChuongTrinh 
        AND ct.MaMonHoc = @MaMonHoc
        OPTION (RECOMPILE, USE HINT('ENABLE_PARALLEL_PLAN_PREFERENCE'));
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE()
        RAISERROR(@ErrorMessage, 16, 1)
    END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[SP_CapNhatKhoiKienThuc]    Script Date: 22/06/2025 10:19:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CapNhatKhoiKienThuc]
    @MaKhoiKienThuc VARCHAR(10),
    @TenKhoiKienThuc NVARCHAR(100),
    @ParentID VARCHAR(10) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- 1. Kiểm tra mã khối kiến thức tồn tại
    IF NOT EXISTS (SELECT 1 FROM KhoiKienThuc WHERE MaKhoiKienThuc = @MaKhoiKienThuc)
    BEGIN
        RAISERROR('Không tìm thấy khối kiến thức với mã %s.', 16, 1, @MaKhoiKienThuc);
        RETURN;
    END

    -- 2. Kiểm tra ParentID không phải chính nó
    IF @ParentID = @MaKhoiKienThuc
    BEGIN
        RAISERROR('ParentID không được trùng với chính mã khối kiến thức.', 16, 1);
        RETURN;
    END

    -- 3. Kiểm tra ParentID tồn tại nếu có
    IF @ParentID IS NOT NULL AND NOT EXISTS (SELECT 1 FROM KhoiKienThuc WHERE MaKhoiKienThuc = @ParentID)
    BEGIN
        RAISERROR('ParentID với mã %s không tồn tại.', 16, 1, @ParentID);
        RETURN;
    END

    -- 4. Kiểm tra vòng lặp phân cấp
    IF @ParentID IS NOT NULL
    BEGIN
        -- Khởi tạo bảng biến để lưu cây phân cấp
        DECLARE @Hierarchy TABLE (
            MaKhoiKienThuc VARCHAR(10),
            ParentID VARCHAR(10)
        );

        -- Duyệt cây phân cấp từ ParentID
        WITH CTE_Hierarchy AS (
            SELECT MaKhoiKienThuc, ParentID
            FROM KhoiKienThuc
            WHERE MaKhoiKienThuc = @ParentID
            UNION ALL
            SELECT k.MaKhoiKienThuc, k.ParentID
            FROM KhoiKienThuc k
            INNER JOIN CTE_Hierarchy h ON k.MaKhoiKienThuc = h.ParentID
        )
        INSERT INTO @Hierarchy
        SELECT MaKhoiKienThuc, ParentID FROM CTE_Hierarchy;

        -- Nếu tìm thấy chính nó trong chuỗi phân cấp => vòng lặp
        IF EXISTS (SELECT 1 FROM @Hierarchy WHERE MaKhoiKienThuc = @MaKhoiKienThuc)
        BEGIN
            RAISERROR('Không thể gán ParentID vì sẽ tạo vòng lặp phân cấp.', 16, 1);
            RETURN;
        END
    END

    -- 5. Cập nhật
    UPDATE KhoiKienThuc
    SET TenKhoiKienThuc = @TenKhoiKienThuc,
        ParentID = @ParentID
    WHERE MaKhoiKienThuc = @MaKhoiKienThuc;

    -- 6. Trả kết quả
    SELECT * FROM KhoiKienThuc WHERE MaKhoiKienThuc = @MaKhoiKienThuc;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CapNhatMonHoc]    Script Date: 22/06/2025 10:19:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_CapNhatMonHoc]
    @MaMonHoc varchar(15),
    @TenMonHoc nvarchar(150) = NULL,
    @SoTinChi float = NULL,
    @SoTietLiThuyet int = NULL,
    @SoTietBaiTap int = NULL,
    @SoTietThucHanh int = NULL,
    @SoTietTuHoc int = NULL,
    @NgonNguDay nvarchar(50) = NULL,
    @LoaiMon nvarchar(50) = NULL,
    @MaKhoiKienThuc varchar(10) = NULL,
    @MaMonHocTruoc varchar(15) = NULL,
    @MaMonHocTienQuyet varchar(15) = NULL,
    @MaMonHocSongHanh varchar(15) = NULL,
    @TenMonHocTiengAnh nvarchar(150) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Kiểm tra môn học tồn tại
    IF NOT EXISTS (SELECT 1 FROM MonHoc WHERE MaMonHoc = @MaMonHoc)
    BEGIN
        RAISERROR('Môn học với mã %s không tồn tại', 16, 1, @MaMonHoc);
        RETURN;
    END
    
    -- Kiểm tra khối kiến thức
    IF @MaKhoiKienThuc IS NOT NULL AND NOT EXISTS (SELECT 1 FROM KhoiKienThuc WHERE MaKhoiKienThuc = @MaKhoiKienThuc)
    BEGIN
        RAISERROR('Khối kiến thức với mã %s không tồn tại', 16, 1, @MaKhoiKienThuc);
        RETURN;
    END
    
    -- Kiểm tra môn học trước
    IF @MaMonHocTruoc IS NOT NULL AND NOT EXISTS (SELECT 1 FROM MonHoc WHERE MaMonHoc = @MaMonHocTruoc)
    BEGIN
        RAISERROR('Môn học trước với mã %s không tồn tại', 16, 1, @MaMonHocTruoc);
        RETURN;
    END
    
    -- Kiểm tra môn học tiên quyết
    IF @MaMonHocTienQuyet IS NOT NULL AND NOT EXISTS (SELECT 1 FROM MonHoc WHERE MaMonHoc = @MaMonHocTienQuyet)
    BEGIN
        RAISERROR('Môn học tiên quyết với mã %s không tồn tại', 16, 1, @MaMonHocTienQuyet);
        RETURN;
    END
    
    -- Kiểm tra môn học song hành
    IF @MaMonHocSongHanh IS NOT NULL AND NOT EXISTS (SELECT 1 FROM MonHoc WHERE MaMonHoc = @MaMonHocSongHanh)
    BEGIN
        RAISERROR('Môn học song hành với mã %s không tồn tại', 16, 1, @MaMonHocSongHanh);
        RETURN;
    END
    
    -- Cập nhật môn học
    UPDATE MonHoc
    SET 
        TenMonHoc = ISNULL(@TenMonHoc, TenMonHoc),
        SoTinChi = ISNULL(@SoTinChi, SoTinChi),
        SoTietLiThuyet = ISNULL(@SoTietLiThuyet, SoTietLiThuyet),
        SoTietBaiTap = ISNULL(@SoTietBaiTap, SoTietBaiTap),
        SoTietThucHanh = ISNULL(@SoTietThucHanh, SoTietThucHanh),
        SoTietTuHoc = ISNULL(@SoTietTuHoc, SoTietTuHoc),
        NgonNguDay = ISNULL(@NgonNguDay, NgonNguDay),
        LoaiMon = ISNULL(@LoaiMon, LoaiMon),
        MaKhoiKienThuc = ISNULL(@MaKhoiKienThuc, MaKhoiKienThuc),
        MaMonHocTruoc = ISNULL(@MaMonHocTruoc, MaMonHocTruoc),
        MaMonHocTienQuyet = ISNULL(@MaMonHocTienQuyet, MaMonHocTienQuyet),
        MaMonHocSongHanh = ISNULL(@MaMonHocSongHanh, MaMonHocSongHanh),
        TenMonHocTiengAnh = ISNULL(@TenMonHocTiengAnh, TenMonHocTiengAnh)
    WHERE MaMonHoc = @MaMonHoc;
    
    -- Trả về môn học đã cập nhật với thông tin JOIN
    SELECT 
        mh.MaMonHoc,
        mh.TenMonHoc,
        mh.SoTinChi,
        mh.SoTietLiThuyet,
        mh.SoTietBaiTap,
        mh.SoTietThucHanh,
        mh.SoTietTuHoc,
        mh.NgonNguDay,
        mh.LoaiMon,
        mh.MaKhoiKienThuc,
        kkt.TenKhoiKienThuc,
        mh.MaMonHocTruoc,
        mht.TenMonHoc AS TenMonHocTruoc,
        mh.MaMonHocTienQuyet,
        mhtq.TenMonHoc AS TenMonHocTienQuyet,
        mh.MaMonHocSongHanh,
        mhsh.TenMonHoc AS TenMonHocSongHanh,
        mh.TenMonHocTiengAnh
    FROM MonHoc mh
    LEFT JOIN KhoiKienThuc kkt ON mh.MaKhoiKienThuc = kkt.MaKhoiKienThuc
    LEFT JOIN MonHoc mht ON mh.MaMonHocTruoc = mht.MaMonHoc
    LEFT JOIN MonHoc mhtq ON mh.MaMonHocTienQuyet = mhtq.MaMonHoc
    LEFT JOIN MonHoc mhsh ON mh.MaMonHocSongHanh = mhsh.MaMonHoc
    WHERE mh.MaMonHoc = @MaMonHoc;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CheckMonSau]    Script Date: 22/06/2025 10:19:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_CheckMonSau]
    @MaChuongTrinh VARCHAR(10),
    @MaMonHoc VARCHAR(15)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        SELECT ct.KyHoc, mh.TenMonHoc
        FROM ChiTiet_CTDT ct
        INNER JOIN MonHoc mh ON ct.MaMonHoc = mh.MaMonHoc
        WHERE ct.MaChuongTrinh = @MaChuongTrinh 
        AND mh.MaMonHocTienQuyet = @MaMonHoc
        OPTION (RECOMPILE, USE HINT('ENABLE_PARALLEL_PLAN_PREFERENCE'));
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE()
        RAISERROR(@ErrorMessage, 16, 1)
    END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[SP_CheckMonTienQuyetHocKy]    Script Date: 22/06/2025 10:19:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CheckMonTienQuyetHocKy]
    @MaChuongTrinh VARCHAR(10),
    @MaMonHoc VARCHAR(15)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        -- Kiểm tra xem môn học có phải là môn tiên quyết của môn học khác trong CTDT không
        SELECT DISTINCT
            mh.MaMonHoc,
            mh.TenMonHoc,
            ct.KyHoc
        FROM ChiTiet_CTDT ct
        INNER JOIN MonHoc mh ON mh.MaMonHoc = ct.MaMonHoc
        WHERE ct.MaChuongTrinh = @MaChuongTrinh
        AND mh.MaMonHocTienQuyet = @MaMonHoc;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE()
        RAISERROR(@ErrorMessage, 16, 1)
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CheckPermission]    Script Date: 22/06/2025 10:19:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Stored Procedure để kiểm tra quyền
CREATE PROCEDURE [dbo].[SP_CheckPermission]
    @ID varchar(10),
    @RequiredRole nvarchar(50)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @UserRole nvarchar(50);

    -- Lấy quyền của người dùng
    SELECT @UserRole = Quyen 
    FROM [dbo].[User] 
    WHERE ID = @ID;

    -- Kiểm tra quyền
    IF @UserRole = 'PHONGDAOTAO' -- PHONGDAOTAO có full quyền
        SELECT 1 AS HasPermission;
    ELSE IF @UserRole = @RequiredRole -- Kiểm tra quyền cụ thể
        SELECT 1 AS HasPermission;
    ELSE
        SELECT 0 AS HasPermission;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetChuyenNganhByMaCT]    Script Date: 22/06/2025 10:19:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetChuyenNganhByMaCT]
    @MaChuongTrinh VARCHAR(10)
AS
BEGIN
    SET NOCOUNT ON;

    -- Lấy thông tin chuyên ngành và môn học theo học kỳ
    WITH ChuyenNganhInfo AS (
        -- Lấy thông tin chuyên ngành (các khối kiến thức có ParentID = 'KKT012')
        SELECT DISTINCT 
            kkt.MaKhoiKienThuc,
            kkt.TenKhoiKienThuc,
            kkt.ParentID
        FROM ChiTiet_CTDT ctdt
        INNER JOIN MonHoc mh ON ctdt.MaMonHoc = mh.MaMonHoc
        INNER JOIN KhoiKienThuc kkt ON mh.MaKhoiKienThuc = kkt.MaKhoiKienThuc
        WHERE ctdt.MaChuongTrinh = @MaChuongTrinh
        AND kkt.ParentID = 'KKT012'
    ),
    HocKyMonHoc AS (
        -- Lấy danh sách học kỳ và môn học cho mỗi chuyên ngành
        SELECT 
            cn.MaKhoiKienThuc,
            cn.ParentID,
            ctdt.KyHoc,
            JSON_QUERY((
                SELECT 
                    mh.MaMonHoc as maMonHoc,
                    mh.TenMonHoc as tenMonHoc,
                    mh.SoTinChi as soTinChi,
                    mh.SoTietLiThuyet as soTietLiThuyet,
                    mh.SoTietBaiTap as soTietBaiTap,
                    mh.SoTietThucHanh as soTietThucHanh,
                    mh.SoTietTuHoc as soTietTuHoc,
                    mh.NgonNguDay as ngonNguDay,
                    mh.LoaiMon as loaiMon,
                    kkt2.MaKhoiKienThuc as maKhoiKienThuc,
                    kkt2.TenKhoiKienThuc as tenKhoiKienThuc,
                    mh.MaMonHocTruoc as maMonHocTruoc,
                    mh.MaMonHocTienQuyet as maMonHocTienQuyet,
                    mh.MaMonHocSongHanh as maMonHocSongHanh,
                    mh.TenMonHocTiengAnh as tenMonHocTiengAnh
                FROM ChiTiet_CTDT ctdt2
                INNER JOIN MonHoc mh ON ctdt2.MaMonHoc = mh.MaMonHoc
                INNER JOIN KhoiKienThuc kkt2 ON mh.MaKhoiKienThuc = kkt2.MaKhoiKienThuc
                WHERE ctdt2.MaChuongTrinh = @MaChuongTrinh
                AND ctdt2.KyHoc = ctdt.KyHoc
                AND (
                    -- Lấy môn học thuộc chuyên ngành hiện tại
                    kkt2.MaKhoiKienThuc = cn.MaKhoiKienThuc
                    OR 
                    -- Lấy môn học có ParentID = null hoặc khác với ParentID của chuyên ngành
                    (kkt2.ParentID IS NULL OR (kkt2.ParentID != cn.ParentID AND kkt2.MaKhoiKienThuc != cn.MaKhoiKienThuc))
                )
                FOR JSON PATH
            )) as monHoc
        FROM ChuyenNganhInfo cn
        CROSS JOIN ChiTiet_CTDT ctdt
        WHERE ctdt.MaChuongTrinh = @MaChuongTrinh
        GROUP BY cn.MaKhoiKienThuc, cn.ParentID, ctdt.KyHoc
    )
    SELECT 
        cn.MaKhoiKienThuc,
        cn.TenKhoiKienThuc,
        (
            SELECT 
                hk.KyHoc as hocKy,
                hk.monHoc
            FROM HocKyMonHoc hk
            WHERE hk.MaKhoiKienThuc = cn.MaKhoiKienThuc
            AND hk.monHoc IS NOT NULL
            AND JSON_QUERY(hk.monHoc) != '[]'
            ORDER BY 
                CAST(SUBSTRING(hk.KyHoc, 3, 2) AS INT) -- Sắp xếp theo số học kỳ
            FOR JSON PATH
        ) as keHoachHocTap
    FROM ChuyenNganhInfo cn
    ORDER BY cn.MaKhoiKienThuc;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetDanhSachChuongTrinhDaoTao]    Script Date: 22/06/2025 10:19:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_GetDanhSachChuongTrinhDaoTao]
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        SELECT 
            MaChuongTrinh,
            TenChuongTrinh,
            MaNganh,
            TrinhDoDaoTao,
            HinhThucDaoTao,
            NamApDung
        FROM ChuongTrinhDaoTao
        ORDER BY NamApDung DESC, MaChuongTrinh ASC;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE()
        RAISERROR(@ErrorMessage, 16, 1)
    END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[SP_GetDanhSachKhoa]    Script Date: 22/06/2025 10:19:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetDanhSachKhoa]
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT 
        MaKhoa, 
        TenKhoa
    FROM Khoa
    ORDER BY MaKhoa;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetDanhSachMonHoc]    Script Date: 22/06/2025 10:19:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_GetDanhSachMonHoc]
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT 
        mh.MaMonHoc,
        mh.TenMonHoc,
        mh.SoTinChi,
        mh.SoTietLiThuyet,
        mh.SoTietBaiTap,
        mh.SoTietThucHanh,
        mh.SoTietTuHoc,
        mh.NgonNguDay,
        mh.LoaiMon,
        mh.MaKhoiKienThuc,
        kkt.TenKhoiKienThuc,
        mh.MaMonHocTruoc,
        mht.TenMonHoc AS TenMonHocTruoc,
        mh.MaMonHocTienQuyet,
        mhtq.TenMonHoc AS TenMonHocTienQuyet,
        mh.MaMonHocSongHanh,
        mhsh.TenMonHoc AS TenMonHocSongHanh,
        mh.TenMonHocTiengAnh
    FROM MonHoc mh
    LEFT JOIN KhoiKienThuc kkt ON mh.MaKhoiKienThuc = kkt.MaKhoiKienThuc
    LEFT JOIN MonHoc mht ON mh.MaMonHocTruoc = mht.MaMonHoc
    LEFT JOIN MonHoc mhtq ON mh.MaMonHocTienQuyet = mhtq.MaMonHoc
    LEFT JOIN MonHoc mhsh ON mh.MaMonHocSongHanh = mhsh.MaMonHoc
    ORDER BY mh.MaMonHoc;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetDanhSachMonTuChon]    Script Date: 22/06/2025 10:19:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetDanhSachMonTuChon]
    @MaChuongTrinh VARCHAR(10),
    @MaKhoiKienThuc VARCHAR(10),
    @HocKy VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    -- Tối ưu: lọc dữ liệu từng bảng trước (chiếu + chọn), rồi mới JOIN
    ;WITH MonHocLoc AS (
        SELECT 
            MaMonHoc,
            TenMonHoc,
            SoTinChi,
            SoTietLiThuyet,
            SoTietBaiTap,
            SoTietThucHanh,
            SoTietTuHoc,
            NgonNguDay,
            LoaiMon,
            MaKhoiKienThuc,
            MaMonHocTruoc,
            MaMonHocTienQuyet,
            MaMonHocSongHanh,
            TenMonHocTiengAnh
        FROM MonHoc WITH (INDEX=IX_MaKhoiKienThuc) -- nếu có index phù hợp
        WHERE MaKhoiKienThuc = @MaKhoiKienThuc AND LoaiMon = N'Tự chọn'
    ),
    CTDTLoc AS (
        SELECT MaMonHoc, KyHoc
        FROM ChiTiet_CTDT
        WHERE MaChuongTrinh = @MaChuongTrinh AND KyHoc = @HocKy
    )
    SELECT 
        mh.MaMonHoc,
        mh.TenMonHoc,
        mh.SoTinChi,
        mh.SoTietLiThuyet,
        mh.SoTietBaiTap,
        mh.SoTietThucHanh,
        mh.SoTietTuHoc,
        mh.NgonNguDay,
        mh.LoaiMon,
        mh.MaKhoiKienThuc,
        mh.MaMonHocTruoc,
        mh.MaMonHocTienQuyet,
        mh.MaMonHocSongHanh,
        mh.TenMonHocTiengAnh,
        ct.KyHoc
    FROM MonHocLoc mh
    INNER JOIN CTDTLoc ct ON mh.MaMonHoc = ct.MaMonHoc
    ORDER BY mh.MaMonHoc;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetDanhSachNganh]    Script Date: 22/06/2025 10:19:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_GetDanhSachNganh]
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT 
        ng.MaNganh,
        ng.TenNganh,
        ng.MaKhoa,
        k.TenKhoa,
        ng.MoTa,
        (SELECT COUNT(*) FROM ChuongTrinhDaoTao ct WHERE ct.MaNganh = ng.MaNganh) AS SoChuongTrinh
    FROM Nganh ng
    INNER JOIN Khoa k ON ng.MaKhoa = k.MaKhoa
    ORDER BY ng.TenNganh;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetKhoiKienThucChuyenNganh]    Script Date: 22/06/2025 10:19:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetKhoiKienThucChuyenNganh]
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT 
        kkt.MaKhoiKienThuc, 
        kkt.TenKhoiKienThuc, 
        kkt.ParentID,
        ISNULL(SUM(mh.SoTinChi), 0) AS TongSoTinChi
    FROM KhoiKienThuc kkt
    LEFT JOIN MonHoc mh ON kkt.MaKhoiKienThuc = mh.MaKhoiKienThuc
    WHERE kkt.ParentID = 'KKT012'
    GROUP BY kkt.MaKhoiKienThuc, kkt.TenKhoiKienThuc, kkt.ParentID
    ORDER BY kkt.MaKhoiKienThuc;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetKhoiKienThucHierarchy]    Script Date: 22/06/2025 10:19:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_GetKhoiKienThucHierarchy]
AS
BEGIN
    SET NOCOUNT ON;
    
    WITH KhoiKienThucHierarchy AS (
        -- Lấy tất cả các khối kiến thức cha (ParentID IS NULL)
        SELECT 
            MaKhoiKienThuc, 
            TenKhoiKienThuc, 
            ParentID,
            0 AS Level
        FROM KhoiKienThuc
        WHERE ParentID IS NULL
        
        UNION ALL
        
        -- Lấy tất cả các khối kiến thức con
        SELECT 
            kkt.MaKhoiKienThuc, 
            kkt.TenKhoiKienThuc, 
            kkt.ParentID,
            h.Level + 1
        FROM KhoiKienThuc kkt
        INNER JOIN KhoiKienThucHierarchy h ON kkt.ParentID = h.MaKhoiKienThuc
    )
    
    -- Lấy kết quả cuối cùng với tổng số tín chỉ trực tiếp cho mỗi khối kiến thức
    -- (chỉ bao gồm môn học trực tiếp thuộc khối kiến thức đó)
    SELECT 
        h.MaKhoiKienThuc, 
        h.TenKhoiKienThuc, 
        h.ParentID,
        h.Level,
        ISNULL(SUM(mh.SoTinChi), 0) AS TongSoTinChi
    FROM KhoiKienThucHierarchy h
    LEFT JOIN MonHoc mh ON h.MaKhoiKienThuc = mh.MaKhoiKienThuc
    GROUP BY h.MaKhoiKienThuc, h.TenKhoiKienThuc, h.ParentID, h.Level
    ORDER BY h.Level, h.MaKhoiKienThuc;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetMonHocByKhoiKienThuc]    Script Date: 22/06/2025 10:19:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_GetMonHocByKhoiKienThuc]
    @MaKhoiKienThuc varchar(10)
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Lấy danh sách môn học thuộc khối kiến thức này
    SELECT 
        mh.MaMonHoc,
        mh.TenMonHoc,
        mh.SoTinChi,
        mh.SoTietLiThuyet,
        mh.SoTietBaiTap,
        mh.SoTietThucHanh,
        mh.SoTietTuHoc,
        mh.NgonNguDay,
        mh.LoaiMon,
        mh.MaKhoiKienThuc,
        kkt.TenKhoiKienThuc,
        mh.MaMonHocTruoc,
        mhtruoc.TenMonHoc AS TenMonHocTruoc,
        mh.MaMonHocTienQuyet,
        mhtq.TenMonHoc AS TenMonHocTienQuyet,
        mh.MaMonHocSongHanh,
        mhsh.TenMonHoc AS TenMonHocSongHanh,
        mh.TenMonHocTiengAnh
    FROM MonHoc mh
    LEFT JOIN KhoiKienThuc kkt ON mh.MaKhoiKienThuc = kkt.MaKhoiKienThuc
    LEFT JOIN MonHoc mhtruoc ON mh.MaMonHocTruoc = mhtruoc.MaMonHoc
    LEFT JOIN MonHoc mhtq ON mh.MaMonHocTienQuyet = mhtq.MaMonHoc
    LEFT JOIN MonHoc mhsh ON mh.MaMonHocSongHanh = mhsh.MaMonHoc
    WHERE mh.MaKhoiKienThuc = @MaKhoiKienThuc
    ORDER BY mh.TenMonHoc;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetMonHocByMa]    Script Date: 22/06/2025 10:19:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_GetMonHocByMa]
    @MaMonHoc varchar(15)
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT 
        mh.MaMonHoc,
        mh.TenMonHoc,
        mh.SoTinChi,
        mh.SoTietLiThuyet,
        mh.SoTietBaiTap,
        mh.SoTietThucHanh,
        mh.SoTietTuHoc,
        mh.NgonNguDay,
        mh.LoaiMon,
        mh.MaKhoiKienThuc,
        kkt.TenKhoiKienThuc,
        mh.MaMonHocTruoc,
        mht.TenMonHoc AS TenMonHocTruoc,
        mh.MaMonHocTienQuyet,
        mhtq.TenMonHoc AS TenMonHocTienQuyet,
        mh.MaMonHocSongHanh,
        mhsh.TenMonHoc AS TenMonHocSongHanh,
        mh.TenMonHocTiengAnh
    FROM MonHoc mh
    LEFT JOIN KhoiKienThuc kkt ON mh.MaKhoiKienThuc = kkt.MaKhoiKienThuc
    LEFT JOIN MonHoc mht ON mh.MaMonHocTruoc = mht.MaMonHoc
    LEFT JOIN MonHoc mhtq ON mh.MaMonHocTienQuyet = mhtq.MaMonHoc
    LEFT JOIN MonHoc mhsh ON mh.MaMonHocSongHanh = mhsh.MaMonHoc
    WHERE mh.MaMonHoc = @MaMonHoc;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetThongTinMonHoc]    Script Date: 22/06/2025 10:19:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_GetThongTinMonHoc]
    @MaChuongTrinh VARCHAR(10),
    @MaMonHoc VARCHAR(15)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        SELECT 
            ct.KyHoc, 
            mh.TenMonHoc,
            mh.MaMonHocTienQuyet,
            mhtq.TenMonHoc as TenMonHocTienQuyet
        FROM ChiTiet_CTDT ct
        INNER JOIN MonHoc mh ON ct.MaMonHoc = mh.MaMonHoc
        LEFT JOIN MonHoc mhtq ON mh.MaMonHocTienQuyet = mhtq.MaMonHoc
        WHERE ct.MaChuongTrinh = @MaChuongTrinh 
        AND ct.MaMonHoc = @MaMonHoc
        OPTION (RECOMPILE, USE HINT('ENABLE_PARALLEL_PLAN_PREFERENCE'));
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE()
        RAISERROR(@ErrorMessage, 16, 1)
    END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[SP_GetToanBoChuongTrinhDaoTaoByMaCT]    Script Date: 22/06/2025 10:19:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetToanBoChuongTrinhDaoTaoByMaCT]
    @MaChuongTrinh varchar(10)
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Kiểm tra chương trình đào tạo tồn tại
    IF NOT EXISTS (SELECT 1 FROM ChuongTrinhDaoTao WHERE MaChuongTrinh = @MaChuongTrinh)
    BEGIN
        RAISERROR(N'Không tìm thấy chương trình đào tạo có mã %s', 16, 1, @MaChuongTrinh);
        RETURN;
    END
    
    -- Trả về thông tin chương trình đào tạo
    SELECT * FROM ChuongTrinhDaoTao WHERE MaChuongTrinh = @MaChuongTrinh;
    
    -- Lấy danh sách tất cả các khối kiến thức
    SELECT 
        kkt.MaKhoiKienThuc,
        kkt.TenKhoiKienThuc,
        kkt.ParentID,
        pkkt.TenKhoiKienThuc as TenKhoiKienThucCha
    FROM KhoiKienThuc kkt
    LEFT JOIN KhoiKienThuc pkkt ON kkt.ParentID = pkkt.MaKhoiKienThuc
    ORDER BY 
        CASE 
            WHEN kkt.ParentID IS NULL THEN 0 
            ELSE 1 
        END,
        kkt.MaKhoiKienThuc;
    
    -- Lấy chi tiết môn học cho từng học kỳ theo thứ tự
    SELECT 
        ct.KyHoc,
        mh.MaMonHoc,
        mh.TenMonHoc,
        mh.SoTinChi,
        mh.SoTietLiThuyet,
        mh.SoTietBaiTap,
        mh.SoTietThucHanh,
        mh.SoTietTuHoc,
        mh.NgonNguDay,
        mh.LoaiMon,
        mh.MaKhoiKienThuc,
        kkt.TenKhoiKienThuc,
        kkt.ParentID,
        pkkt.TenKhoiKienThuc as TenKhoiKienThucCha,
        mh.MaMonHocTruoc,
        mh.MaMonHocTienQuyet,
        mhtq.TenMonHoc AS TenMonHocTienQuyet,
        mh.MaMonHocSongHanh,
        mh.TenMonHocTiengAnh,
        CASE 
            WHEN ct.KyHoc LIKE 'HK7-%' THEN SUBSTRING(ct.KyHoc, 5, LEN(ct.KyHoc))
            WHEN ct.KyHoc LIKE 'HK8-%' THEN SUBSTRING(ct.KyHoc, 5, LEN(ct.KyHoc))
            ELSE NULL
        END AS MaChuyenNganh
    FROM ChiTiet_CTDT ct
    INNER JOIN MonHoc mh ON ct.MaMonHoc = mh.MaMonHoc
    LEFT JOIN KhoiKienThuc kkt ON mh.MaKhoiKienThuc = kkt.MaKhoiKienThuc
    LEFT JOIN KhoiKienThuc pkkt ON kkt.ParentID = pkkt.MaKhoiKienThuc
    LEFT JOIN MonHoc mhtq ON mh.MaMonHocTienQuyet = mhtq.MaMonHoc
    WHERE ct.MaChuongTrinh = @MaChuongTrinh
    ORDER BY 
        CASE 
            WHEN ct.KyHoc = 'HK9' THEN 9
            WHEN ct.KyHoc LIKE 'HK7-%' THEN 7
            WHEN ct.KyHoc LIKE 'HK8-%' THEN 8
            ELSE CAST(SUBSTRING(ct.KyHoc, 3, 1) AS INT)
        END,
        ct.KyHoc,
        mh.TenMonHoc;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Login]    Script Date: 22/06/2025 10:19:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[SP_Login]
    @TenDangNhap varchar(50),
    @MatKhau nvarchar(100)
AS
BEGIN
    SET NOCOUNT ON;

    -- Truy vấn chính với các phép chọn trước và JOIN tối ưu
    SELECT 
        u.ID, 
        u.TenDangNhap, 
        u.Quyen AS Role, 
        COALESCE(sv.HoTen, gv.HoTen) AS HoTen,
        sv.MaNganh, 
        ng.TenNganh, 
        gv.MaKhoa, 
        k.TenKhoa
    FROM [dbo].[User] u
    LEFT JOIN [dbo].[SinhVien] sv ON u.ID = sv.MaSinhVien
    LEFT JOIN [dbo].[GiangVien] gv ON u.ID = gv.MaGiangVien
    LEFT JOIN [dbo].[Nganh] ng ON sv.MaNganh = ng.MaNganh
    LEFT JOIN [dbo].[Khoa] k ON gv.MaKhoa = k.MaKhoa
    WHERE u.TenDangNhap = @TenDangNhap 
        AND u.MatKhau = @MatKhau;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ThemKhoiKienThuc]    Script Date: 22/06/2025 10:19:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ThemKhoiKienThuc]
    @MaKhoiKienThuc VARCHAR(10),
    @TenKhoiKienThuc NVARCHAR(100),
    @ParentID VARCHAR(10) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- Kiểm tra mã đã tồn tại chưa
    IF EXISTS (SELECT 1 FROM KhoiKienThuc WHERE MaKhoiKienThuc = @MaKhoiKienThuc)
    BEGIN
        RAISERROR('Khối kiến thức với mã %s đã tồn tại.', 16, 1, @MaKhoiKienThuc);
        RETURN;
    END

    -- Kiểm tra ParentID (nếu có)
    IF @ParentID IS NOT NULL AND NOT EXISTS (SELECT 1 FROM KhoiKienThuc WHERE MaKhoiKienThuc = @ParentID)
    BEGIN
        RAISERROR('ParentID với mã %s không tồn tại.', 16, 1, @ParentID);
        RETURN;
    END

    -- Thêm mới
    INSERT INTO KhoiKienThuc (MaKhoiKienThuc, TenKhoiKienThuc, ParentID)
    VALUES (@MaKhoiKienThuc, @TenKhoiKienThuc, @ParentID);

    -- Trả kết quả
    SELECT * FROM KhoiKienThuc WHERE MaKhoiKienThuc = @MaKhoiKienThuc;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ThemMonHoc]    Script Date: 22/06/2025 10:19:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_ThemMonHoc]
    @MaMonHoc varchar(15),
    @TenMonHoc nvarchar(150),
    @SoTinChi float,
    @SoTietLiThuyet int = NULL,
    @SoTietBaiTap int = NULL,
    @SoTietThucHanh int = NULL,
    @SoTietTuHoc int = NULL,
    @NgonNguDay nvarchar(50) = NULL,
    @LoaiMon nvarchar(50) = NULL,
    @MaKhoiKienThuc varchar(10) = NULL,
    @MaMonHocTruoc varchar(15) = NULL,
    @MaMonHocTienQuyet varchar(15) = NULL,
    @MaMonHocSongHanh varchar(15) = NULL,
    @TenMonHocTiengAnh nvarchar(150) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Kiểm tra môn học đã tồn tại chưa
    IF EXISTS (SELECT 1 FROM MonHoc WHERE MaMonHoc = @MaMonHoc)
    BEGIN
        RAISERROR('Môn học với mã %s đã tồn tại', 16, 1, @MaMonHoc);
        RETURN;
    END
    
    -- Kiểm tra khối kiến thức
    IF @MaKhoiKienThuc IS NOT NULL AND NOT EXISTS (SELECT 1 FROM KhoiKienThuc WHERE MaKhoiKienThuc = @MaKhoiKienThuc)
    BEGIN
        RAISERROR('Khối kiến thức với mã %s không tồn tại', 16, 1, @MaKhoiKienThuc);
        RETURN;
    END
    
    -- Kiểm tra môn học trước
    IF @MaMonHocTruoc IS NOT NULL AND NOT EXISTS (SELECT 1 FROM MonHoc WHERE MaMonHoc = @MaMonHocTruoc)
    BEGIN
        RAISERROR('Môn học trước với mã %s không tồn tại', 16, 1, @MaMonHocTruoc);
        RETURN;
    END
    
    -- Kiểm tra môn học tiên quyết
    IF @MaMonHocTienQuyet IS NOT NULL AND NOT EXISTS (SELECT 1 FROM MonHoc WHERE MaMonHoc = @MaMonHocTienQuyet)
    BEGIN
        RAISERROR('Môn học tiên quyết với mã %s không tồn tại', 16, 1, @MaMonHocTienQuyet);
        RETURN;
    END
    
    -- Kiểm tra môn học song hành
    IF @MaMonHocSongHanh IS NOT NULL AND NOT EXISTS (SELECT 1 FROM MonHoc WHERE MaMonHoc = @MaMonHocSongHanh)
    BEGIN
        RAISERROR('Môn học song hành với mã %s không tồn tại', 16, 1, @MaMonHocSongHanh);
        RETURN;
    END
    
    -- Thêm môn học mới
    INSERT INTO MonHoc (
        MaMonHoc,
        TenMonHoc,
        SoTinChi,
        SoTietLiThuyet,
        SoTietBaiTap,
        SoTietThucHanh,
        SoTietTuHoc,
        NgonNguDay,
        LoaiMon,
        MaKhoiKienThuc,
        MaMonHocTruoc,
        MaMonHocTienQuyet,
        MaMonHocSongHanh,
        TenMonHocTiengAnh
    ) VALUES (
        @MaMonHoc,
        @TenMonHoc,
        @SoTinChi,
        @SoTietLiThuyet,
        @SoTietBaiTap,
        @SoTietThucHanh,
        @SoTietTuHoc,
        @NgonNguDay,
        @LoaiMon,
        @MaKhoiKienThuc,
        @MaMonHocTruoc,
        @MaMonHocTienQuyet,
        @MaMonHocSongHanh,
        @TenMonHocTiengAnh
    );
    
    -- Trả về môn học vừa thêm với thông tin JOIN
    SELECT 
        mh.MaMonHoc,
        mh.TenMonHoc,
        mh.SoTinChi,
        mh.SoTietLiThuyet,
        mh.SoTietBaiTap,
        mh.SoTietThucHanh,
        mh.SoTietTuHoc,
        mh.NgonNguDay,
        mh.LoaiMon,
        mh.MaKhoiKienThuc,
        kkt.TenKhoiKienThuc,
        mh.MaMonHocTruoc,
        mht.TenMonHoc AS TenMonHocTruoc,
        mh.MaMonHocTienQuyet,
        mhtq.TenMonHoc AS TenMonHocTienQuyet,
        mh.MaMonHocSongHanh,
        mhsh.TenMonHoc AS TenMonHocSongHanh,
        mh.TenMonHocTiengAnh
    FROM MonHoc mh
    LEFT JOIN KhoiKienThuc kkt ON mh.MaKhoiKienThuc = kkt.MaKhoiKienThuc
    LEFT JOIN MonHoc mht ON mh.MaMonHocTruoc = mht.MaMonHoc
    LEFT JOIN MonHoc mhtq ON mh.MaMonHocTienQuyet = mhtq.MaMonHoc
    LEFT JOIN MonHoc mhsh ON mh.MaMonHocSongHanh = mhsh.MaMonHoc
    WHERE mh.MaMonHoc = @MaMonHoc;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ThemMonHocVaoCTDT]    Script Date: 22/06/2025 10:19:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ThemMonHocVaoCTDT]
    @MaChuongTrinh VARCHAR(20),
    @HocKy VARCHAR(50),
    @MaMonHoc VARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        -- Kiểm tra chương trình đào tạo tồn tại
        IF NOT EXISTS (SELECT 1 FROM ChuongTrinhDaoTao 
                       WHERE MaChuongTrinh = @MaChuongTrinh)
        BEGIN
            RAISERROR(N'Chương trình đào tạo không tồn tại', 16, 1);
            RETURN;
        END

        -- Kiểm tra môn học tồn tại
        IF NOT EXISTS (SELECT 1 FROM MonHoc WHERE MaMonHoc = @MaMonHoc)
        BEGIN
            RAISERROR(N'Môn học không tồn tại', 16, 1);
            RETURN;
        END

        -- Kiểm tra môn học đã tồn tại trong chương trình
        IF EXISTS (SELECT 1 FROM ChiTiet_CTDT 
                   WHERE MaChuongTrinh = @MaChuongTrinh AND MaMonHoc = @MaMonHoc)
        BEGIN
            RAISERROR(N'Môn học đã tồn tại trong chương trình đào tạo', 16, 1);
            RETURN;
        END

        -- Thêm môn học vào chương trình
        INSERT INTO ChiTiet_CTDT (MaChuongTrinh, KyHoc, MaMonHoc)
        VALUES (@MaChuongTrinh, @HocKy, @MaMonHoc);

        SELECT N'Thêm môn học thành công' AS Message;

    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE()
        RAISERROR(@ErrorMessage, 16, 1)
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ThemMonTuChonVaoHocKy]    Script Date: 22/06/2025 10:19:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ThemMonTuChonVaoHocKy]
    @MaChuongTrinh VARCHAR(10),
    @MaKhoiKienThuc VARCHAR(10),
    @HocKy VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @MonTuChonTiepTheo VARCHAR(15);
    DECLARE @CoMonTuChon BIT;
    
    -- Kiểm tra xem đã có môn tự chọn nào trong khối kiến thức này chưa
    SELECT @CoMonTuChon = CASE 
        WHEN EXISTS (
            SELECT 1 
            FROM ChiTiet_CTDT ctdt
            JOIN MonHoc mh ON ctdt.MaMonHoc = mh.MaMonHoc
            WHERE ctdt.MaChuongTrinh = @MaChuongTrinh
            AND mh.MaKhoiKienThuc = @MaKhoiKienThuc
            AND ISNUMERIC(ctdt.MaMonHoc) = 1
        ) THEN 1
        ELSE 0
    END;

    IF @CoMonTuChon = 0
    BEGIN
        -- Nếu chưa có môn tự chọn, lấy môn học có mã nhỏ nhất
        SELECT TOP 1 @MonTuChonTiepTheo = mh.MaMonHoc
        FROM MonHoc mh
        WHERE mh.MaKhoiKienThuc = @MaKhoiKienThuc
        AND ISNUMERIC(mh.MaMonHoc) = 1
        AND NOT EXISTS (
            SELECT 1 
            FROM ChiTiet_CTDT ctdt 
            WHERE ctdt.MaChuongTrinh = @MaChuongTrinh 
            AND ctdt.MaMonHoc = mh.MaMonHoc
        )
        ORDER BY CAST(mh.MaMonHoc AS INT);
    END
    ELSE
    BEGIN
        -- Nếu đã có môn tự chọn, lấy mã môn học lớn nhất + 1
        SELECT @MonTuChonTiepTheo = CAST(MAX(CAST(ctdt.MaMonHoc AS INT)) + 1 AS VARCHAR)
        FROM ChiTiet_CTDT ctdt
        JOIN MonHoc mh ON ctdt.MaMonHoc = mh.MaMonHoc
        WHERE ctdt.MaChuongTrinh = @MaChuongTrinh
        AND mh.MaKhoiKienThuc = @MaKhoiKienThuc
        AND ISNUMERIC(ctdt.MaMonHoc) = 1;
    END

    -- Kiểm tra xem môn tự chọn tiếp theo có tồn tại trong bảng MonHoc không
    IF EXISTS (
        SELECT 1 
        FROM MonHoc mh
        WHERE mh.MaMonHoc = @MonTuChonTiepTheo 
        AND mh.MaKhoiKienThuc = @MaKhoiKienThuc
        AND NOT EXISTS (
            SELECT 1 
            FROM ChiTiet_CTDT ctdt 
            WHERE ctdt.MaChuongTrinh = @MaChuongTrinh 
            AND ctdt.MaMonHoc = @MonTuChonTiepTheo
        )
    )
    BEGIN
        -- Thêm môn tự chọn vào CTDT
        INSERT INTO ChiTiet_CTDT (MaChuongTrinh, MaMonHoc, KyHoc)
        VALUES (@MaChuongTrinh, @MonTuChonTiepTheo, @HocKy);
        
        SELECT 1 AS Success, 'Thêm môn tự chọn thành công' AS Message;
    END
    ELSE
    BEGIN
        SELECT 0 AS Success, 'Không tìm thấy môn tự chọn phù hợp để thêm' AS Message;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ThemSinhVien]    Script Date: 22/06/2025 10:19:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_ThemSinhVien]
    @HoTen nvarchar(100),
    @NgaySinh date,
    @MaNganh varchar(10),
    @NamNhapHoc int,
    @Email varchar(100) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @MaSinhVien varchar(10);
    DECLARE @SoThuTu int;
    DECLARE @MatKhau nvarchar(100);

    -- Chuyển đổi NgaySinh thành mật khẩu (ddMMyyyy)
    SET @MatKhau = REPLACE(CONVERT(varchar(10), @NgaySinh, 103), '/', '');

    -- Tạo số thứ tự dựa trên số lượng sinh viên đã có của ngành và năm nhập học
    SELECT @SoThuTu = ISNULL(COUNT(*) + 1, 1)
    FROM [dbo].[SinhVien]
    WHERE MaNganh = @MaNganh AND NamNhapHoc = @NamNhapHoc;

    -- Tạo MaSinhVien: MaNganh + NamNhapHoc + SoThuTu (3 chữ số)
    SET @MaSinhVien = @MaNganh + CAST(@NamNhapHoc AS varchar(4)) + RIGHT('000' + CAST(@SoThuTu AS varchar(3)), 3);

    -- Bắt đầu giao dịch để đảm bảo tính toàn vẹn dữ liệu
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Chèn vào bảng SinhVien
        INSERT INTO [dbo].[SinhVien] (MaSinhVien, HoTen, NgaySinh, MaNganh, NamNhapHoc, Email)
        VALUES (@MaSinhVien, @HoTen, @NgaySinh, @MaNganh, @NamNhapHoc, @Email);

        -- Chèn vào bảng User với MaSinhVien làm ID và TenDangNhap
        INSERT INTO [dbo].[User] (ID, TenDangNhap, MatKhau, Quyen)
        VALUES (@MaSinhVien, @MaSinhVien, @MatKhau, N'Sinh viên');

        COMMIT TRANSACTION;

        -- Trả về thông tin sinh viên vừa thêm
        SELECT 
            MaSinhVien, 
            HoTen, 
            NgaySinh, 
            MaNganh, 
            NamNhapHoc, 
            Email,
            @MatKhau AS MatKhau
        FROM [dbo].[SinhVien]
        WHERE MaSinhVien = @MaSinhVien;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_XemChiTietHocKy]    Script Date: 22/06/2025 10:19:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_XemChiTietHocKy]
    @MaChuongTrinh varchar(10),
    @HocKy nvarchar(50),
    @MaChuyenNganh varchar(10) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Tạo mã học kỳ đầy đủ nếu cần
    DECLARE @KyHocInt int;
    DECLARE @HocKyFull nvarchar(50) = @HocKy;
    
    SET @KyHocInt = CAST(SUBSTRING(@HocKy, 3, LEN(@HocKy)) AS int);
    
    IF @KyHocInt BETWEEN 7 AND 8 AND @MaChuyenNganh IS NOT NULL
    BEGIN
        SET @HocKyFull = @HocKy + '-' + @MaChuyenNganh;
    END
    
    -- Lấy danh sách môn học trong học kỳ
    SELECT 
        ct.MaChuongTrinh,
        ct.MaMonHoc,
        mh.TenMonHoc,
        mh.SoTinChi,
        mh.MaKhoiKienThuc,
        kkt.TenKhoiKienThuc,
        mh.MaMonHocTienQuyet,
        mhtq.TenMonHoc AS TenMonHocTienQuyet
    FROM ChiTiet_CTDT ct
    INNER JOIN MonHoc mh ON ct.MaMonHoc = mh.MaMonHoc
    LEFT JOIN KhoiKienThuc kkt ON mh.MaKhoiKienThuc = kkt.MaKhoiKienThuc
    LEFT JOIN MonHoc mhtq ON mh.MaMonHocTienQuyet = mhtq.MaMonHoc
    WHERE ct.MaChuongTrinh = @MaChuongTrinh AND ct.KyHoc = @HocKyFull;
    
    -- Lấy thông tin tổng hợp học kỳ
    SELECT 
        @HocKyFull AS KyHoc,
        COUNT(mh.MaMonHoc) AS SoMonHoc,
        SUM(mh.SoTinChi) AS TongTinChi
    FROM ChiTiet_CTDT ct
    INNER JOIN MonHoc mh ON ct.MaMonHoc = mh.MaMonHoc
    WHERE ct.MaChuongTrinh = @MaChuongTrinh AND ct.KyHoc = @HocKyFull;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_XoaKhoiKienThuc]    Script Date: 22/06/2025 10:19:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_XoaKhoiKienThuc]
    @MaKhoiKienThuc VARCHAR(10)
AS
BEGIN
    SET NOCOUNT ON;

    -- Kiểm tra tồn tại
    IF NOT EXISTS (SELECT 1 FROM KhoiKienThuc WHERE MaKhoiKienThuc = @MaKhoiKienThuc)
    BEGIN
        RAISERROR('Không tìm thấy khối kiến thức với mã %s.', 16, 1, @MaKhoiKienThuc);
        RETURN;
    END

    -- Kiểm tra ràng buộc: có môn học nào đang dùng không?
    IF EXISTS (SELECT 1 FROM MonHoc WHERE MaKhoiKienThuc = @MaKhoiKienThuc)
    BEGIN
        RAISERROR('Không thể xóa vì có môn học đang liên kết với khối kiến thức này.', 16, 1);
        RETURN;
    END

    -- Kiểm tra nếu là ParentID của khối khác
    IF EXISTS (SELECT 1 FROM KhoiKienThuc WHERE ParentID = @MaKhoiKienThuc)
    BEGIN
        RAISERROR('Không thể xóa vì đang là ParentID của khối kiến thức khác.', 16, 1);
        RETURN;
    END

    -- Xóa
    DELETE FROM KhoiKienThuc WHERE MaKhoiKienThuc = @MaKhoiKienThuc;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_XoaMonHoc]    Script Date: 22/06/2025 10:19:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_XoaMonHoc]
    @MaMonHoc varchar(15)
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Kiểm tra môn học tồn tại
    IF NOT EXISTS (SELECT 1 FROM MonHoc WHERE MaMonHoc = @MaMonHoc)
    BEGIN
        RAISERROR('Môn học với mã %s không tồn tại', 16, 1, @MaMonHoc);
        RETURN;
    END
    
    -- Kiểm tra môn học có đang được sử dụng làm môn học tiên quyết không
    IF EXISTS (SELECT 1 FROM MonHoc WHERE MaMonHocTienQuyet = @MaMonHoc)
    BEGIN
        DECLARE @MonLienQuan nvarchar(MAX) = '';
        SELECT @MonLienQuan = @MonLienQuan + MaMonHoc + ' (' + TenMonHoc + '), ' 
        FROM MonHoc 
        WHERE MaMonHocTienQuyet = @MaMonHoc;
        
        SET @MonLienQuan = LEFT(@MonLienQuan, LEN(@MonLienQuan) - 1);
        RAISERROR('Không thể xóa môn học này vì nó là môn tiên quyết cho các môn: %s', 16, 1, @MonLienQuan);
        RETURN;
    END
    
    -- Kiểm tra môn học có đang được sử dụng làm môn học trước không
    IF EXISTS (SELECT 1 FROM MonHoc WHERE MaMonHocTruoc = @MaMonHoc)
    BEGIN
        DECLARE @MonLienQuan2 nvarchar(MAX) = '';
        SELECT @MonLienQuan2 = @MonLienQuan2 + MaMonHoc + ' (' + TenMonHoc + '), ' 
        FROM MonHoc 
        WHERE MaMonHocTruoc = @MaMonHoc;
        
        SET @MonLienQuan2 = LEFT(@MonLienQuan2, LEN(@MonLienQuan2) - 1);
        RAISERROR('Không thể xóa môn học này vì nó là môn học trước cho các môn: %s', 16, 1, @MonLienQuan2);
        RETURN;
    END
    
    -- Kiểm tra môn học có đang được sử dụng làm môn học song hành không
    IF EXISTS (SELECT 1 FROM MonHoc WHERE MaMonHocSongHanh = @MaMonHoc)
    BEGIN
        DECLARE @MonLienQuan3 nvarchar(MAX) = '';
        SELECT @MonLienQuan3 = @MonLienQuan3 + MaMonHoc + ' (' + TenMonHoc + '), ' 
        FROM MonHoc 
        WHERE MaMonHocSongHanh = @MaMonHoc;
        
        SET @MonLienQuan3 = LEFT(@MonLienQuan3, LEN(@MonLienQuan3) - 1);
        RAISERROR('Không thể xóa môn học này vì nó là môn học song hành cho các môn: %s', 16, 1, @MonLienQuan3);
        RETURN;
    END
    
    -- Kiểm tra môn học có trong chương trình đào tạo nào không
    IF EXISTS (SELECT 1 FROM ChiTiet_CTDT WHERE MaMonHoc = @MaMonHoc)
    BEGIN
        DECLARE @CTDT nvarchar(MAX) = '';
        SELECT @CTDT = @CTDT + ct.MaChuongTrinh + ' (' + ctdt.TenChuongTrinh + '), ' 
        FROM ChiTiet_CTDT ct
        JOIN ChuongTrinhDaoTao ctdt ON ct.MaChuongTrinh = ctdt.MaChuongTrinh
        WHERE ct.MaMonHoc = @MaMonHoc
        GROUP BY ct.MaChuongTrinh, ctdt.TenChuongTrinh;
        
        SET @CTDT = LEFT(@CTDT, LEN(@CTDT) - 1);
        RAISERROR('Không thể xóa môn học này vì nó đang thuộc các chương trình đào tạo: %s', 16, 1, @CTDT);
        RETURN;
    END
    
    -- Lưu thông tin môn học trước khi xóa để trả về
    -- Thêm JOIN để lấy các thông tin liên quan
    DECLARE @DeletedMonHoc TABLE (
        MaMonHoc varchar(15),
        TenMonHoc nvarchar(150),
        SoTinChi float,
        MaKhoiKienThuc varchar(10),
        TenKhoiKienThuc nvarchar(150),
        MaMonHocTienQuyet varchar(15),
        TenMonHocTienQuyet nvarchar(150)
    );
    
    INSERT INTO @DeletedMonHoc
    SELECT 
        mh.MaMonHoc, 
        mh.TenMonHoc,
        mh.SoTinChi,
        mh.MaKhoiKienThuc,
        kkt.TenKhoiKienThuc,
        mh.MaMonHocTienQuyet,
        mhtq.TenMonHoc AS TenMonHocTienQuyet
    FROM MonHoc mh
    LEFT JOIN KhoiKienThuc kkt ON mh.MaKhoiKienThuc = kkt.MaKhoiKienThuc
    LEFT JOIN MonHoc mhtq ON mh.MaMonHocTienQuyet = mhtq.MaMonHoc
    WHERE mh.MaMonHoc = @MaMonHoc;
    
    -- Xóa môn học
    DELETE FROM MonHoc WHERE MaMonHoc = @MaMonHoc;
    
    -- Trả về thông tin môn học đã xóa
    SELECT * FROM @DeletedMonHoc;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_XoaMonHocKhoiCTDT]    Script Date: 22/06/2025 10:19:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_XoaMonHocKhoiCTDT]
    @MaChuongTrinh VARCHAR(10),
    @MaMonHoc VARCHAR(15)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        DELETE FROM ChiTiet_CTDT
        WHERE MaChuongTrinh = @MaChuongTrinh 
        AND MaMonHoc = @MaMonHoc;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE()
        RAISERROR(@ErrorMessage, 16, 1)
    END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[SP_XoaMonTuChonKhoiHocKy]    Script Date: 22/06/2025 10:19:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_XoaMonTuChonKhoiHocKy]
    @MaChuongTrinh VARCHAR(10),
    @MaMonHoc VARCHAR(15),
    @HocKy VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Kiểm tra xem môn học có phải là môn tự chọn không
    IF EXISTS (
        SELECT 1 
        FROM ChiTiet_CTDT ctdt
        JOIN MonHoc mh ON ctdt.MaMonHoc = mh.MaMonHoc
        WHERE ctdt.MaChuongTrinh = @MaChuongTrinh
        AND ctdt.MaMonHoc = @MaMonHoc
        AND ctdt.KyHoc = @HocKy
        AND ISNUMERIC(ctdt.MaMonHoc) = 1
    )
    BEGIN
        -- Xóa môn học tự chọn
        DELETE FROM ChiTiet_CTDT
        WHERE MaChuongTrinh = @MaChuongTrinh
        AND MaMonHoc = @MaMonHoc
        AND KyHoc = @HocKy;
        
        SELECT 1 AS Success, 'Xóa môn tự chọn thành công' AS Message;
    END
    ELSE
    BEGIN
        SELECT 0 AS Success, 'Không tìm thấy môn tự chọn cần xóa' AS Message;
    END
END
GO
