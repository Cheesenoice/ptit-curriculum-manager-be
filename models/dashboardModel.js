const { sql, poolPromise } = require("../config/database");

class DashboardModel {
  async getSummary() {
    try {
      const pool = await poolPromise;
      const result = await pool.request().query(`
                SELECT
                    (SELECT COUNT(*) FROM SinhVien) AS soSinhVien,
                    (SELECT COUNT(*) FROM GiangVien) AS soGiangVien,
                    (SELECT COUNT(*) FROM Nganh) AS soNganh,
                    (SELECT COUNT(*) FROM Khoa) AS soKhoa,
                    (SELECT COUNT(*) FROM ChuongTrinhDaoTao) AS soChuongTrinhDaoTao,
                    (SELECT COUNT(*) FROM MonHoc) AS soMonHoc
            `);
      return { success: true, data: result.recordset[0] };
    } catch (error) {
      return { success: false, message: error.message };
    }
  }
  async getTopNganhSinhVien() {
    try {
      const pool = await poolPromise;
      const result = await pool.request().query(`
                SELECT TOP 5 n.TenNganh, COUNT(sv.MaSinhVien) AS soSinhVien
                FROM Nganh n
                LEFT JOIN SinhVien sv ON n.MaNganh = sv.MaNganh
                GROUP BY n.TenNganh
                ORDER BY soSinhVien DESC
            `);
      return { success: true, data: result.recordset };
    } catch (error) {
      return { success: false, message: error.message };
    }
  }
  async getSinhVienNienKhoa() {
    try {
      const pool = await poolPromise;
      const result = await pool.request().query(`
                SELECT NamNhapHoc, COUNT(*) AS soSinhVien
                FROM SinhVien
                GROUP BY NamNhapHoc
                ORDER BY NamNhapHoc
            `);
      return { success: true, data: result.recordset };
    } catch (error) {
      return { success: false, message: error.message };
    }
  }
  async getGiangVienKhoa() {
    try {
      const pool = await poolPromise;
      const result = await pool.request().query(`
                SELECT k.TenKhoa, COUNT(gv.MaGiangVien) AS soGiangVien
                FROM Khoa k
                LEFT JOIN GiangVien gv ON k.MaKhoa = gv.MaKhoa
                GROUP BY k.TenKhoa
                ORDER BY soGiangVien DESC
            `);
      return { success: true, data: result.recordset };
    } catch (error) {
      return { success: false, message: error.message };
    }
  }
  async getMonHocCTDT() {
    try {
      const pool = await poolPromise;
      const result = await pool.request().query(`
                SELECT ctdt.TenChuongTrinh, COUNT(ctctdt.MaMonHoc) AS soMonHoc
                FROM ChuongTrinhDaoTao ctdt
                LEFT JOIN ChiTiet_CTDT ctctdt ON ctdt.MaChuongTrinh = ctctdt.MaChuongTrinh
                GROUP BY ctdt.TenChuongTrinh
                ORDER BY soMonHoc DESC
            `);
      return { success: true, data: result.recordset };
    } catch (error) {
      return { success: false, message: error.message };
    }
  }
}

module.exports = DashboardModel;
