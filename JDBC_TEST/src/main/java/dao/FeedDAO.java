package dao;

import java.sql.*;
import java.util.ArrayList;
import javax.naming.NamingException;
import dto.FeedDTO;
import util.*;

public class FeedDAO {

    public boolean insert(String uid, String pwd, String ucon, String uimages) throws NamingException, SQLException {
        String sql = "INSERT INTO feed(id, pwd, content, images) VALUES(?, ?, ?, ?)";
        try (Connection conn = ConnectionPool.get();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, uid);
            stmt.setString(2, pwd);
            stmt.setString(3, ucon);
            stmt.setString(4, uimages);
            return stmt.executeUpdate() == 1;
        }
    }

    public boolean deleteFeed(String id, String pwd, String ts) throws NamingException, SQLException {
        String sql = "DELETE FROM feed WHERE id = ? AND pwd = ? AND ts = ?";
        try (Connection conn = ConnectionPool.get();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, id);
            stmt.setString(2, pwd);
            stmt.setString(3, ts);
            return stmt.executeUpdate() == 1;
        }
    }

    public ArrayList<FeedObj> getList() throws NamingException, SQLException {
        String sql = "SELECT no, id, content, ts, images FROM feed ORDER BY ts DESC";
        ArrayList<FeedObj> feeds = new ArrayList<>();
        try (Connection conn = ConnectionPool.get();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while(rs.next()) {
                feeds.add(new FeedObj(
                    rs.getInt("no"),
                    rs.getString("id"),
                    rs.getString("content"),
                    rs.getString("ts"),
                    rs.getString("images")
                ));
            }
        }
        return feeds;
    }

    public FeedDTO getFeedByNo(int no) throws NamingException, SQLException {
        String sql = "SELECT * FROM feed WHERE no=?";
        FeedDTO dto = null;
        try (Connection conn = ConnectionPool.get();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, no);
            try (ResultSet rs = stmt.executeQuery()) {
                if(rs.next()) {
                    dto = new FeedDTO();
                    dto.setNo(rs.getInt("no"));
                    dto.setId(rs.getString("id"));
                    dto.setContent(rs.getString("content"));
                    dto.setImages(rs.getString("images"));
                    dto.setPwd(rs.getString("pwd"));
                    dto.setTs(rs.getString("ts"));
                }
            }
        }
        return dto;
    }

    public boolean updateFeedByNo(int no, String content, String images) throws NamingException, SQLException {
        String sql = "UPDATE feed SET content=?, images=? WHERE no=?";
        try (Connection conn = ConnectionPool.get();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, content);
            stmt.setString(2, images);
            stmt.setInt(3, no);
            return stmt.executeUpdate() == 1;
        }
    }
}
