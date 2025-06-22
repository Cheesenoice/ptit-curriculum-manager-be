const express = require("express");
const router = express.Router();
const SinhVienController = require("../controllers/sinhVienController");
const { verifyToken, restrictTo } = require("../middleware/auth");

const sinhVienController = new SinhVienController();

// Route thêm sinh viên, chỉ PHONGDAOTAO được phép
router.post(
  "/sinhvien/them",
  verifyToken,
  restrictTo("Phòng đào tạo"),
  (req, res) => sinhVienController.themSinhVien(req, res)
);

// Lấy danh sách sinh viên
router.get("/sinhvien", verifyToken, restrictTo("Phòng đào tạo"), (req, res) =>
  sinhVienController.layDanhSachSinhVien(req, res)
);

// Lấy sinh viên theo mã
router.get(
  "/sinhvien/:maSinhVien",
  verifyToken,
  restrictTo("Phòng đào tạo"),
  (req, res) => sinhVienController.laySinhVienTheoMa(req, res)
);

// Cập nhật sinh viên
router.put(
  "/sinhvien/capnhat",
  verifyToken,
  restrictTo("Phòng đào tạo"),
  (req, res) => sinhVienController.capNhatSinhVien(req, res)
);

// Xóa sinh viên
router.delete(
  "/sinhvien/xoa/:maSinhVien",
  verifyToken,
  restrictTo("Phòng đào tạo"),
  (req, res) => sinhVienController.xoaSinhVien(req, res)
);

module.exports = router;
