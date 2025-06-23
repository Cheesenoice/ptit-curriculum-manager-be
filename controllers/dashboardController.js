const DashboardModel = require("../models/dashboardModel");

class DashboardController {
  constructor() {
    this.dashboardModel = new DashboardModel();
  }
  async getSummary(req, res) {
    const result = await this.dashboardModel.getSummary();
    return res.status(result.success ? 200 : 400).json(result);
  }
  async getTopNganhSinhVien(req, res) {
    const result = await this.dashboardModel.getTopNganhSinhVien();
    return res.status(result.success ? 200 : 400).json(result);
  }
  async getSinhVienNienKhoa(req, res) {
    const result = await this.dashboardModel.getSinhVienNienKhoa();
    return res.status(result.success ? 200 : 400).json(result);
  }
  async getGiangVienKhoa(req, res) {
    const result = await this.dashboardModel.getGiangVienKhoa();
    return res.status(result.success ? 200 : 400).json(result);
  }
  async getMonHocCTDT(req, res) {
    const result = await this.dashboardModel.getMonHocCTDT();
    return res.status(result.success ? 200 : 400).json(result);
  }
}

module.exports = DashboardController;
