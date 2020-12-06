package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.*;

public class BookCopyDAO extends DAO {

	private static final String GET_LIST_IDLE_BOOK_COPY_BY_BOOK_ID = "SELECT * FROM `tblbookcopy` WHERE `bookId` = ? "
			+ "AND `id` NOT IN(SELECT `bookCopyId` FROM `tblbookborrowformdetail` WHERE `status` != 'returned') "
			+ "LIMIT ?";
	
	private static final String GET_NUM_OF_AVALIBLE_BOOK = "SELECT COUNT(`id`) AS avaNum FROM `tblbookcopy` WHERE `bookId` = ? "
			+ "AND `id` NOT IN(SELECT `bookCopyId` FROM `tblbookborrowformdetail` WHERE `status` != 'returned'); ";

	public ArrayList<BookCopy> searchListIdleBook(Book book, int amount) throws SQLException {
		try {
			Connection connection = getConnection();
			// try-with-resource statement will auto close the connection.
			PreparedStatement preparedStatement = connection.prepareStatement(GET_LIST_IDLE_BOOK_COPY_BY_BOOK_ID);
			preparedStatement.setInt(1, book.getId());
			preparedStatement.setInt(2, amount);
			ResultSet resultSet = preparedStatement.executeQuery();
			ArrayList<BookCopy> idleBookList = new ArrayList<>();
			if (resultSet.next() != false) {
				do {
					BookCopy bookCopy = new BookCopy(resultSet.getInt("id"), resultSet.getInt("libraryid"),
							resultSet.getInt("bookid"));
					idleBookList.add(bookCopy);
				} while (resultSet.next());
			}
			return idleBookList;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public int getNumOfAvaBook(Book book) {
		try {
			Connection connection = getConnection();
			// try-with-resource statement will auto close the connection.
			PreparedStatement preparedStatement = connection.prepareStatement(GET_NUM_OF_AVALIBLE_BOOK);
			preparedStatement.setInt(1, book.getId());
			ResultSet resultSet = preparedStatement.executeQuery();
			if (resultSet.next() != false) {
				do {
					return resultSet.getInt("avaNum");
				} while (resultSet.next());
			}
			return -1;
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		}
	}

}
