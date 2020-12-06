package dao;

import model.Book;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BookDAO extends DAO {
	private static final String GET_BOOK_LIST_BY_NAME = "SELECT * FROM `tblbook` WHERE `name` LIKE ?";
	
	private static final String GET_BOOK_BY_ID = "SELECT * FROM `tblbook` WHERE `id` = ?";

	public ResultSet searchBook(String bookName) throws SQLException {
		try {
			Connection connection = getConnection();
			// try-with-resource statement will auto close the connection.
			PreparedStatement preparedStatement = connection.prepareStatement(GET_BOOK_LIST_BY_NAME);
			preparedStatement.setString(1, "%" + bookName + "%");
			ResultSet resultSet = preparedStatement.executeQuery();
			return resultSet;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public Book getBookById(String bookId) throws SQLException {
		try {
			Connection connection = getConnection();
			// try-with-resource statement will auto close the connection.
			PreparedStatement preparedStatement = connection.prepareStatement(GET_BOOK_BY_ID);
			preparedStatement.setString(1, bookId);
			ResultSet resultSet = preparedStatement.executeQuery();
			Book book = new Book();
			while(resultSet.next()) {
				book.setId(resultSet.getInt("id"));
				book.setName(resultSet.getString("name"));
				book.setAuthor(resultSet.getString("author"));
				book.setPrice(resultSet.getDouble("price"));
			}
			return book;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
}
