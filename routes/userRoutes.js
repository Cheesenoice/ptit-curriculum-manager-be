const express = require("express");
const router = express.Router();
const UserController = require("../controllers/userController");
const { verifyToken, restrictTo } = require("../middleware/auth");

const userController = new UserController();

router.post("/user/dangnhap", (req, res) => userController.dangNhap(req, res));
router.post(
  "/user/phongdaotao/them",
  verifyToken,
  restrictTo("Phòng đào tạo"),
  (req, res) => userController.themPhongDaoTao(req, res)
);
router.delete(
  "/user/phongdaotao/xoa/:id",
  verifyToken,
  restrictTo("Phòng đào tạo"),
  (req, res) => userController.xoaPhongDaoTao(req, res)
);
router.get(
  "/user/phongdaotao",
  verifyToken,
  restrictTo("Phòng đào tạo"),
  (req, res) => userController.layDanhSachPhongDaoTao(req, res)
);

module.exports = router;
