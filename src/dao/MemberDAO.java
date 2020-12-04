package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import model.Member;

public class MemberDAO extends DAO {

	private static final String INSERT_MEMBER = "INSERT INTO `tblmember` "
			+ "(`id`, `username`, `password`, `fullname`, `dateofbirth`, `email`, `phone`, `securityid`, `address`, `gender`, `role`) "
			+ "VALUES (NULL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
	private static final String INSERT_READER = "START TRANSACTION;" + INSERT_MEMBER 
			+ "INSERT INTO `tblreader` (`readerId`) VALUES (LAST_INSERT_ID());COMMIT;";
	
	public boolean checkSignup(Member member) throws SQLException {
		System.out.println(INSERT_READER);
		// try-with-resource statement will auto close the connection.
		try (Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(INSERT_READER)) {
			preparedStatement.setString(1, member.getUsername());
			preparedStatement.setString(2, member.getPassword());
			preparedStatement.setString(3, member.getFullname());
			preparedStatement.setDate(4, member.getDateofbirth());
			preparedStatement.setString(5, member.getEmail());
			preparedStatement.setString(6, member.getPhone());
			preparedStatement.setString(7, member.getSecurityId());
			preparedStatement.setString(8, member.getAddress());
			preparedStatement.setString(9, member.getGender());
			preparedStatement.setString(10, "reader");
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
}
