const SinhVienModel = require("../models/sinhVienModel");

class SinhVienController {
  constructor() {
    this.sinhVienModel = new SinhVienModel();
  }

  async themSinhVien(req, res) {
    try {
      const {
        maSinhVien,
        hoTen,
        ngaySinh,
        maNganh,
        namNhapHoc,
        email,
        tenDangNhap,
        matKhau,
      } = req.body;

      // Kiểm tra dữ liệu đầu vào
      if (
        !maSinhVien ||
        !hoTen ||
        !ngaySinh ||
        !maNganh ||
        !namNhapHoc ||
        !tenDangNhap ||
        !matKhau
      ) {
        return res.status(400).json({
          success: false,
          message:
            "Mã sinh viên, họ tên, ngày sinh, mã ngành, năm nhập học, tên đăng nhập và mật khẩu không được để trống",
        });
      }

      let ngaySinhValue = null;
      if (ngaySinh) {
        // Nếu là chuỗi hợp lệ, giữ nguyên
        // Nếu là Date object, chuyển sang yyyy-mm-dd
        const d = new Date(ngaySinh);
        if (isNaN(d.getTime())) {
          return res
            .status(400)
            .json({ success: false, message: "Ngày sinh không hợp lệ" });
        }
        ngaySinhValue = d.toISOString().slice(0, 10);
      }

      // Gọi phương thức từ model để thêm sinh viên
      const result = await this.sinhVienModel.themSinhVien(
        maSinhVien,
        hoTen,
        ngaySinhValue,
        maNganh,
        namNhapHoc,
        email,
        tenDangNhap,
        matKhau
      );

      if (result.success) {
        return res.status(200).json(result);
      } else {
        return res.status(400).json(result);
      }
    } catch (error) {
      return res.status(500).json({
        success: false,
        message: "Lỗi server: " + error.message,
      });
    }
  }

  async capNhatSinhVien(req, res) {
    try {
      const { maSinhVien, hoTen, ngaySinh, maNganh, namNhapHoc, email } =
        req.body;
      if (!maSinhVien) {
        return res
          .status(400)
          .json({ success: false, message: "Thiếu mã sinh viên" });
      }
      const result = await this.sinhVienModel.capNhatSinhVien(
        maSinhVien,
        hoTen,
        ngaySinh,
        maNganh,
        namNhapHoc,
        email
      );
      return res.status(result.success ? 200 : 400).json(result);
    } catch (error) {
      return res.status(500).json({ success: false, message: error.message });
    }
  }

  async xoaSinhVien(req, res) {
    try {
      const { maSinhVien } = req.params;
      if (!maSinhVien) {
        return res
          .status(400)
          .json({ success: false, message: "Thiếu mã sinh viên" });
      }
      const result = await this.sinhVienModel.xoaSinhVien(maSinhVien);
      return res.status(result.success ? 200 : 400).json(result);
    } catch (error) {
      return res.status(500).json({ success: false, message: error.message });
    }
  }

  async layDanhSachSinhVien(req, res) {
    try {
      const result = await this.sinhVienModel.layDanhSachSinhVien();
      return res.status(result.success ? 200 : 400).json(result);
    } catch (error) {
      return res.status(500).json({ success: false, message: error.message });
    }
  }

  async laySinhVienTheoMa(req, res) {
    try {
      const { maSinhVien } = req.params;
      if (!maSinhVien) {
        return res
          .status(400)
          .json({ success: false, message: "Thiếu mã sinh viên" });
      }
      const result = await this.sinhVienModel.laySinhVienTheoMa(maSinhVien);
      return res.status(result.success ? 200 : 400).json(result);
    } catch (error) {
      return res.status(500).json({ success: false, message: error.message });
    }
  }
}

module.exports = SinhVienController;
