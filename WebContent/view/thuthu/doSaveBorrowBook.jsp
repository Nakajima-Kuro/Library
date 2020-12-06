<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, java.sql.Date, dao.*,model.*"%>

<%
	ArrayList<BookBorrowFormDetail> listBorrowBook = (ArrayList<BookBorrowFormDetail>) (session
		.getAttribute("listBorrowBook"));
	Member member = (Member) session.getAttribute("member");
	
	boolean allBookGiven = true;
	
	for(int i = 0; i < listBorrowBook.size();i++){
		if(!listBorrowBook.get(i).getStatus().equals("borrowed")){
			allBookGiven = false;
			break;
		}
	}
	
	if(allBookGiven == true){
		ArrayList<Integer> listFormId = new ArrayList<>();
		for(int i = 0; i < listBorrowBook.size();i++){
			if(i == 0 || listBorrowBook.get(i).getBookborrowFormId() != listBorrowBook.get(i - 1).getBookborrowFormId()){
				listFormId.add(listBorrowBook.get(i).getBookborrowFormId());
			}
		}
		
		BookBorrowFormDetailDAO bookDetailDAO = new BookBorrowFormDetailDAO();
		bookDetailDAO.saveBorrowBook(listBorrowBook, listFormId, member);

		response.sendRedirect("gdChinhThuthu.jsp?message=borrowBookSuccess");
	} else {
		response.sendRedirect("gdListsachmuon.jsp?message=notAllBookGiven");
	}
	
	
%>