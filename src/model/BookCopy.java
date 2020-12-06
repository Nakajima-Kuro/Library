package model;

public class BookCopy {
	
	private int id;
	private int libraryId;
	private int bookId;
	
	public BookCopy(int id, int libraryId, int bookId) {
		super();
		this.id = id;
		this.libraryId = libraryId;
		this.bookId = bookId;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getLibraryId() {
		return libraryId;
	}
	public void setLibraryId(int libraryId) {
		this.libraryId = libraryId;
	}
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
}
