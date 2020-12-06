package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import model.BookBorrowFormDetail;
import model.Member;

public class BookBorrowFormDetailDAO extends DAO {

	private static final String SEARCH_BY_MEMBER_SECURE_ID = "SELECT `tblbookborrowformdetail`.*,`tblbook`.name,`tblbook`.author "
			+ "FROM `tblbookborrowformdetail`, `tblbookcopy`, `tblbook` "
			+ "WHERE `bookborrowFormId` IN (SELECT `id` FROM `tblbookborrowform` "
			+ "WHERE `reader` = (SELECT `id` FROM `tblmember` WHERE `securityid` = ?)) "
			+ "AND `status` = 'pending' AND `tblbook`.`id` = `tblbookcopy`.`bookId` "
			+ "AND `tblbookborrowformdetail`.`bookCopyId` = `tblbookcopy`.`id`";

	private static final String UPDATE_BOOK_BORROW_DETAIL_ID = "UPDATE `tblbookborrowformdetail` SET `status`=? WHERE `id` = ?;";

	public ResultSet searchListBySecureId(Member member) throws SQLException {
		try {
			Connection connection = getConnection();
			// try-with-resource statement will auto close the connection.
			PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_BY_MEMBER_SECURE_ID);
			preparedStatement.setString(1, member.getSecurityId());
			ResultSet resultSet = preparedStatement.executeQuery();
			return resultSet;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	public boolean saveBorrowBook(ArrayList<BookBorrowFormDetail> listBorrowBook,
			ArrayList<Integer> listBookBorrowFormId, Member member) throws SQLException {
		try {
			Connection connection = getConnection();
			// try-with-resource statement will auto close the connection.
			String querry = "START TRANSACTION;";
			for (int i = 0; i < listBorrowBook.size(); i++) {
				querry += "UPDATE `tblbookborrowformdetail` SET `status`='" + listBorrowBook.get(i).getStatus()
						+ "' WHERE `id` = " + listBorrowBook.get(i).getId() + ";";
			}

			java.util.Date ultiDate = new java.util.Date();
			Timestamp today = new Timestamp(ultiDate.getTime());
			today = Timestamp.valueOf(today.toLocalDateTime().plusMonths(1));

			for (int i = 0; i < listBookBorrowFormId.size(); i++) {
				querry += "UPDATE `tblbookborrowform` SET `dueTime`= '" + today + "', `librarian`= " + member.getId()
						+ " WHERE `id` = " + listBookBorrowFormId.get(i) + " ;";
			}
			querry += "COMMIT;";
			PreparedStatement preparedStatement = connection.prepareStatement(querry);
//			System.out.println(preparedStatement);
			ResultSet resultSet = preparedStatement.executeQuery();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

}
