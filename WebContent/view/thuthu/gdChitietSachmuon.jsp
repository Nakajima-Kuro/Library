<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*, dao.*, model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<BookBorrowFormDetail> listBorrowBook = (ArrayList<BookBorrowFormDetail>) (session
		.getAttribute("listBorrowBook"));

ArrayList<Book> listBook = (ArrayList<Book>) (session.getAttribute("listBook"));
%>
<!DOCTYPE html>
<html lang="vi">

<head>
<meta charset="UTF-8">
<jsp:include page="../include.jsp" />
<!--Custom styles-->
<link rel="stylesheet" href="../vendor/css/gdChinhDocgia.css">
<title>Library - Reader</title>
</head>

<body>
	<div class="d-flex" id="wrapper">

		<%@include file="menu.jsp"%>

		<!-- Page Content -->
		<div id="page-content-wrapper">

			<%@include file="navbar.jsp"%>

			<div class="container-fluid">
				<!-- Code in here -->
				<div class="card mt-3">
					<div class="card-header d-flex justify-content-between">
						<div class="my-auto">Search Result</div>
					</div>
					<div class="card-body">
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">#</th>
									<th scope="col">Book name</th>
									<th scope="col">Author</th>
									<th scope="col">Book Copy ID</th>
								</tr>
							</thead>
							<tbody>
								<%
									int j = 1;
								for (int i = 0; i < listBook.size(); i++) {
									if (listBook.get(i).getName().equals(request.getParameter("bookName"))) {
								%>
								<tr>
									<td><%=j++%></td>
									<td><%=listBook.get(i).getName()%></td>
									<td><%=listBook.get(i).getAuthor()%></td>
									<td><%=listBorrowBook.get(i).getBookCopyId()%></td>
								</tr>
								<%
									}
								}
								%>
							</tbody>
						</table>
					</div>
					<div class="card-footer d-flex justify-content-between">
						<a
							href="gdListsachmuon.jsp?giveBook=<%=request.getParameter("bookName")%>"
							class="list-group-item list-group-item-action bg-light mx-2">Confirm</a>
						<a href="gdListsachmuon.jsp"
							class="list-group-item list-group-item-action bg-light mx-2">Cancel</a>
					</div>
				</div>
			</div>
		</div>
		<!-- /#page-content-wrapper -->

	</div>
	<!-- /#wrapper -->
</body>
</html>