package tokoatk;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

public class Sales {
    public String id;
    public LocalDateTime waktu;
    public String username;

    public String getId() {
        return id;
    }

    public LocalDateTime getWaktu() {
        return waktu;
    }

    public String getUsername() {
        return username;
    }

    public boolean baca(String id) {
        Connection conn = null;
        PreparedStatement st;
        ResultSet rs;

        try {
            conn = DBConnection.connect();
            String sql = "SELECT * FROM salesm WHERE id=?";
            st = conn.prepareStatement(sql);
            st.setString(1, id);
            rs = st.executeQuery();

            if (rs.next()) {
                this.id = rs.getString("id");
                this.waktu = rs.getTimestamp("waktu").toLocalDateTime();
                this.username = rs.getString("username");
                return true;
            }
            return false;
        } catch (Exception ex) {
            ex.printStackTrace(); // Tampilkan error di console
            return false;
        } finally {
            try { if (conn != null) conn.close(); } catch (Exception e) {}
        }
    }

    public boolean tambah(String username) {
        Connection conn = null;
        PreparedStatement st;

        try {
            conn = DBConnection.connect();

            LocalDateTime dt = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyMMddHHmmssS");
            id = dt.format(formatter);

            String sql = "INSERT INTO salesm (id, waktu, username) VALUES (?, NOW(), ?)";
            st = conn.prepareStatement(sql);
            st.setString(1, id);
            st.setString(2, username);
            st.executeUpdate();
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        } finally {
            try { if (conn != null) conn.close(); } catch (Exception e) {}
        }
    }

    public boolean hapus() {
        Connection conn = null;
        PreparedStatement st;

        try {
            conn = DBConnection.connect();
            String sql = "DELETE FROM salesm WHERE id=?";
            st = conn.prepareStatement(sql);
            st.setString(1, id);
            st.executeUpdate();
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        } finally {
            try { if (conn != null) conn.close(); } catch (Exception e) {}
        }
    }

    public boolean addDetail(String barangId, int qty, int harga) {
        SalesDetail detail = new SalesDetail();
        detail.salesId = this.id;
        detail.barangId = barangId;
        detail.qty = qty;
        detail.harga = harga;
        return detail.tambah();
    }

    public ArrayList<SalesDetail> getDetail() {
        ArrayList<SalesDetail> result = new ArrayList<>();
        Connection conn = null;
        PreparedStatement st;
        ResultSet rs;

        try {
            conn = DBConnection.connect();
            String sql = "SELECT * FROM salesd WHERE salesId=?";
            st = conn.prepareStatement(sql);
            st.setString(1, this.id);
            rs = st.executeQuery();

            while (rs.next()) {
                SalesDetail entry = new SalesDetail();
                entry.baca(rs.getInt("id"));
                result.add(entry);
            }

            return result;
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        } finally {
            try { if (conn != null) conn.close(); } catch (Exception e) {}
        }
    }

    public static ArrayList<Sales> getList() {
        ArrayList<Sales> result = new ArrayList<>();
        Connection conn = null;
        PreparedStatement st;
        ResultSet rs;

        try {
            conn = DBConnection.connect();
            String sql = "SELECT * FROM salesm ORDER BY waktu DESC";
            st = conn.prepareStatement(sql);
            rs = st.executeQuery();

            while (rs.next()) {
                Sales entry = new Sales();
                entry.baca(rs.getString("id"));
                result.add(entry);
            }

            return result;
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        } finally {
            try { if (conn != null) conn.close(); } catch (Exception e) {}
        }
    }
}
