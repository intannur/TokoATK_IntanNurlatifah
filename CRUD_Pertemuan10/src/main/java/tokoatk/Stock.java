package tokoatk;

import java.sql.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

public class Stock {
    private String id;
    private LocalDateTime waktu;
    private String username;

    public String getId() {
        return this.id;
    }
    public String getWaktu() {
    if (waktu != null) {
        return waktu.toString(); // atau format lain
    } else {
        return "-";
    }
}
    public String getUsername() {
    return username;
}


    
    
    public static ArrayList<Stock> getList() {
    ArrayList<Stock> list = new ArrayList<>();
    try (Connection conn = DBConnection.connect()) {
        String sql = "SELECT id, waktu, username FROM stockm ORDER BY waktu DESC";
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            Stock s = new Stock();
            s.id = rs.getString("id");
            s.waktu = rs.getTimestamp("waktu").toLocalDateTime();
            s.username = rs.getString("username");
            list.add(s);
        }
    } catch (Exception e) {
        System.out.println("Gagal getList stockm: " + e.getMessage());
        e.printStackTrace();
    }
    return list;
}


    public boolean tambah(String username) {
        try (Connection conn = DBConnection.connect()) {
            this.id = "STK" + System.currentTimeMillis();
            this.username = username;
            this.waktu = LocalDateTime.now();

            String sql = "INSERT INTO stockm (id, waktu, username) VALUES (?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, this.id);
            ps.setString(2, waktu.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
            ps.setString(3, username);

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("ERROR tambah stockm: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    public boolean addDetail(String barangId, Integer qty, Integer harga) {
    try (Connection conn = DBConnection.connect()) {
        String sql = "INSERT INTO stockd (stockid, barangid, qty, harga) VALUES (?, ?, ?, ?)";
        PreparedStatement ps = conn.prepareStatement(sql);

        ps.setString(1, id);         // stockid
        ps.setString(2, barangId);   // barangid
        ps.setInt(3, qty);           // qty
        ps.setInt(4, harga);         // harga

        return ps.executeUpdate() > 0;
    } catch (Exception e) {
        System.out.println("GAGAL addDetail:");
        System.out.println("stockid: " + id);
        System.out.println("barangid: " + barangId);
        System.out.println("qty: " + qty);
        System.out.println("harga: " + harga);
        e.printStackTrace();
        return false;
    }

}
    

    }

