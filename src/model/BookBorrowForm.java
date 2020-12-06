package model;

import java.sql.Timestamp;

public class BookBorrowForm {

	private int id;
	private Timestamp borrowTime;
	private Timestamp dueTime;
	private double deposit;
	private String description;
	private int librarian;
	private int reader;
	
	
	public BookBorrowForm() {
		super();
	}
	
	public BookBorrowForm(int id, Timestamp borrowTime, Timestamp dueTime, double deposit, String description, int librarian, int reader) {
		super();
		this.id = id;
		this.borrowTime = borrowTime;
		this.dueTime = dueTime;
		this.deposit = deposit;
		this.description = description;
		this.librarian = librarian;
		this.reader = reader;
	}
	
	public BookBorrowForm(Timestamp borrowTime, double deposit, String description, int readerId) {
		super();
		this.borrowTime = borrowTime;
		this.deposit = deposit;
		this.description = description;
		this.reader = readerId;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Timestamp getBorrowTime() {
		return borrowTime;
	}
	public void setBorrowTime(Timestamp borrowTime) {
		this.borrowTime = borrowTime;
	}
	public Timestamp getDueTime() {
		return dueTime;
	}
	public void setDueTime(Timestamp dueTime) {
		this.dueTime = dueTime;
	}
	public double getDeposit() {
		return deposit;
	}
	public void setDeposit(double deposit) {
		this.deposit = deposit;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getLibrarian() {
		return librarian;
	}
	public void setLibrarian(int librarian) {
		this.librarian = librarian;
	}

	public int getReader() {
		return reader;
	}

	public void setReader(int reader) {
		this.reader = reader;
	}
	
	
}
