const express = require("express");
const router = express.Router();
const DashboardController = require("../controllers/dashboardController");
const { verifyToken } = require("../middleware/auth");

const dashboardController = new DashboardController();

router.get("/dashboard/summary", verifyToken, (req, res) =>
  dashboardController.getSummary(req, res)
);
router.get("/dashboard/top-nganh-sinhvien", verifyToken, (req, res) =>
  dashboardController.getTopNganhSinhVien(req, res)
);
router.get("/dashboard/sinhvien-nienkhoa", verifyToken, (req, res) =>
  dashboardController.getSinhVienNienKhoa(req, res)
);
router.get("/dashboard/giangvien-khoa", verifyToken, (req, res) =>
  dashboardController.getGiangVienKhoa(req, res)
);
router.get("/dashboard/monhoc-ctdt", verifyToken, (req, res) =>
  dashboardController.getMonHocCTDT(req, res)
);

module.exports = router;
