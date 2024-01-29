package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ReserveRepository {
	//Reserve 테이블에 insert하는 함수
    public void insertReserve(String id) {
        String url = "jdbc:mysql://localhost:3306/webp";
        String username = "root";
        String password = "12341234";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(url, username, password);

            // 테이블에 존재하는지 확인
            String selectSql = "SELECT quantity FROM reserve WHERE id=?";
            PreparedStatement selectStatement = connection.prepareStatement(selectSql);
            selectStatement.setString(1, id);
            ResultSet rs = selectStatement.executeQuery();

            if (rs.next()) {
                // 테이블에 존재하면 quantity를 1증가
                int quantity = rs.getInt("quantity") + 1;
                String updateSql = "UPDATE reserve SET quantity=? WHERE id=?";
                PreparedStatement updateStatement = connection.prepareStatement(updateSql);
                updateStatement.setInt(1, quantity);
                updateStatement.setString(2, id);
                updateStatement.executeUpdate();
                updateStatement.close();
            } else {
                // 테이블에 존재하지않으면 quantity를 1로 셋팅
                String insertSql = "INSERT INTO reserve (id, quantity) VALUES (?, 1)";
                PreparedStatement insertStatement = connection.prepareStatement(insertSql);
                insertStatement.setString(1, id);
                insertStatement.executeUpdate();
                insertStatement.close();
            }

            rs.close();
            selectStatement.close();
            connection.close();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
