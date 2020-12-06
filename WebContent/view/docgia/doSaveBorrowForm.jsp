<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, java.sql.Date, dao.*,model.*"%>

<%
	Member member = (Member)session.getAttribute("member");
ArrayList<Book> bookList = (ArrayList<Book>)(session.getAttribute("bookList"));
ArrayList<Integer> amountList = (ArrayList<Integer>)(session.getAttribute("amountList"));
ArrayList<BookCopy> listIdleBook = new ArrayList<>();

BookCopyDAO bookCopyDAO = new BookCopyDAO();

double deposit = 0;

for(int i = 0; i < bookList.size(); i++){
	//Get all idle book
	ArrayList<BookCopy> result = bookCopyDAO.searchListIdleBook(bookList.get(i), amountList.get(i));
	listIdleBook.addAll(result);
	
	//Calculate the deposit
	deposit += bookList.get(i).getPrice() * amountList.get(i) * 0.2;
}

java.util.Date ultiDate = new java.util.Date();
Timestamp today = new Timestamp (ultiDate.getTime());

BookBorrowForm bookBorrowForm = new BookBorrowForm(today,deposit,"",member.getId());

BookBorrowFormDAO bookFormDAO = new BookBorrowFormDAO();
bookFormDAO.saveBorrowForm(bookBorrowForm, listIdleBook);

response.sendRedirect("gdDanhsachDonmuon.jsp");

%>