package model;

public class BookBorrowFormDetail {
	
	private int id;
	private String status;
	private int bookborrowFormId;
	private int bookCopyId;
	
	public BookBorrowFormDetail() {}
	
	public BookBorrowFormDetail(int id, String status, int bookborrowFormId, int bookCopyId) {
		super();
		this.id = id;
		this.status = status;
		this.bookborrowFormId = bookborrowFormId;
		this.bookCopyId = bookCopyId;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getBookborrowFormId() {
		return bookborrowFormId;
	}
	public void setBookborrowFormId(int bookborrowFormId) {
		this.bookborrowFormId = bookborrowFormId;
	}
	public int getBookCopyId() {
		return bookCopyId;
	}
	public void setBookCopyId(int bookCopyId) {
		this.bookCopyId = bookCopyId;
	}

}
