package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Member;

public class MemberDAO extends DAO {

	private static final String INSERT_MEMBER = "INSERT INTO `tblmember` "
			+ "(`id`, `username`, `password`, `fullname`, `dateofbirth`, `email`, `phone`, `securityid`, `address`, `gender`, `role`) "
			+ "VALUES (NULL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
	private static final String INSERT_READER = "START TRANSACTION;" + INSERT_MEMBER
			+ "INSERT INTO `tblreader` (`readerId`) VALUES (LAST_INSERT_ID());COMMIT;";

	private static final String GET_MEMBER_BY_USERNAME_AND_PASSWORD = "SELECT * FROM `tblmember` WHERE `username` = ? AND `password` = ?";

	private static final String GET_MEMBER_BY_USERNAME = "SELECT * FROM `tblmember` WHERE `username` = ?";

	private static final String GET_POSITION_BY_ID = "SELECT `position` FROM `tblemployee` WHERE `memberId` = ?";

	public boolean checkSignup(Member member) throws SQLException {
		try {
			Connection connection = getConnection();
			// try-with-resource statement will auto close the connection.
			// Check if username is duplicate or not
			PreparedStatement preparedStatement = connection.prepareStatement(GET_MEMBER_BY_USERNAME);
			preparedStatement.setString(1, member.getUsername());
			ResultSet resultSet = preparedStatement.executeQuery();
			if (resultSet.next() == false) {
				// Found no member with the same username => Insert new member
				preparedStatement = connection.prepareStatement(INSERT_READER);
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
				preparedStatement.executeUpdate();
				return true;
			} else {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public Member checkSignin(Member member) throws SQLException {
		try {
			Connection connection = getConnection();
			// Check if username is duplicate or not
			PreparedStatement preparedStatement = connection.prepareStatement(GET_MEMBER_BY_USERNAME_AND_PASSWORD);
			preparedStatement.setString(1, member.getUsername());
			preparedStatement.setString(2, member.getPassword());
			ResultSet resultSet = preparedStatement.executeQuery();
			if (resultSet.next() != false) {
				do {
					member.setId(resultSet.getInt("id"));
					member.setAddress(resultSet.getString("address"));
					member.setDateofbirth(Date.valueOf(resultSet.getString("dateofbirth")));
					member.setEmail(resultSet.getString("email"));
					member.setFullname(resultSet.getString("fullname"));
					member.setGender(resultSet.getString("gender"));
					member.setPhone(resultSet.getString("phone"));
					member.setRole(resultSet.getString("role"));
					member.setSecurityId(resultSet.getString("securityid"));
				} while (resultSet.next());
				return member;
			}
			return null;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	public String getPositionById(int id) {
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(GET_POSITION_BY_ID);
			preparedStatement.setInt(1, id);
			ResultSet resultSet = preparedStatement.executeQuery();
			if (resultSet.next() != false) {
				return resultSet.getString("position");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
