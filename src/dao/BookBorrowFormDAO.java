package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.BookBorrowForm;
import model.BookCopy;
import model.Member;

public class BookBorrowFormDAO extends DAO {

	private static final String GET_LIST_BORROW_FORM_BY_READER_ID = "SELECT * FROM `tblbookborrowform` WHERE `reader` = ?";

	private String SAVE_BORROW_FORM = "INSERT INTO `tblbookborrowform`(`borrowTime`, `deposit`, `description`, `reader`) "
			+ "VALUES (?,?,?,?);" + "SET @FormId = LAST_INSERT_ID();";

	public ResultSet searchListBorrowForm(Member member) throws SQLException {
		try {
			Connection connection = getConnection();
			// try-with-resource statement will auto close the connection.
			PreparedStatement preparedStatement = connection.prepareStatement(GET_LIST_BORROW_FORM_BY_READER_ID);
			preparedStatement.setInt(1, member.getId());
			ResultSet resultSet = preparedStatement.executeQuery();
			return resultSet;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	public boolean saveBorrowForm(BookBorrowForm bookBorrowForm, ArrayList<BookCopy> listBookCopy) {
		try {
			Connection connection = getConnection();
			// try-with-resource statement will auto close the connection.
			//Prepare the query
			String query = SAVE_BORROW_FORM;
			query = "START TRANSACTION;" + query;
			for (int i = 0; i < listBookCopy.size(); i++) {
				query += "INSERT INTO `tblbookborrowformdetail`(`status`, `bookborrowFormId`, `bookCopyId`) VALUES ('pending', @FormId ,"
						+ listBookCopy.get(i).getId() + ");";
			}
			query += "COMMIT;";
			
			
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setTimestamp(1, bookBorrowForm.getBorrowTime());
			preparedStatement.setDouble(2, bookBorrowForm.getDeposit());
			preparedStatement.setString(3, bookBorrowForm.getDescription());
			preparedStatement.setInt(4, bookBorrowForm.getReader());
			ResultSet resultSet = preparedStatement.executeQuery();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public double getTotalDeposit(ArrayList<Integer> listFormId) {
		try {
			Connection connection = getConnection();
			// try-with-resource statement will auto close the connection.
			String query = "SELECT SUM(`deposit`) AS `sumDeposit` FROM `tblbookborrowform` WHERE `id` IN (";
			for(int i = 0; i < listFormId.size(); i++) {
				query += listFormId.get(i) + ",";
			}
			query = query.substring(0, query.length() - 1);
			query += ");";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				return resultSet.getDouble("sumDeposit");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
		return 0;
	}
}
