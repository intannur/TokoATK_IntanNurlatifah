
package tokoatk;

import java.sql.*;

public class User {

    public String username;
    public String fullname;

    public boolean login(String username, String password) {
        try (Connection conn = DBConnection.connect()) {
            String sql = "SELECT * FROM users WHERE username=? AND password=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                this.username = username;
                this.fullname = rs.getString("fullname");
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public String getFullname() {
        return fullname;
    }

    public boolean baca(String username) {
        try (Connection conn = DBConnection.connect()) {
            String sql = "SELECT * FROM users WHERE username=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                this.username = username;
                this.fullname = rs.getString("fullname");
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
