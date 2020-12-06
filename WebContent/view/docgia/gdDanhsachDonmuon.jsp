<%@page import="dao.BookBorrowFormDAO, model.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//Get list of the BorrowForm
BookBorrowFormDAO bookBorrowFormDAO = new BookBorrowFormDAO();
ResultSet resultSet = bookBorrowFormDAO.searchListBorrowForm((Member) session.getAttribute("member"));
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
						<div class="my-auto">Book Borrow List</div>
						<div>
							<a href="gdThemdonmuon.jsp?new=true"
								class="list-group-item list-group-item-action bg-light">New
								Borrow Form</a>
						</div>
					</div>
					<div class="card-body">
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">#</th>
									<th scope="col">Borrow Time</th>
									<th scope="col">Due Time</th>
									<th scope="col">Deposit</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								int j = 1;
									while (resultSet.next()) {
								%>
								<tr>
									<th scope="row"><%= j++ %></th>
									<td><%=resultSet.getDate("borrowTime").toString() + " / " + resultSet.getTime("borrowTime")%></td>
									<%
										if (resultSet.getDate("dueTime") != null) {
									%>
									<td><%=resultSet.getDate("dueTime").toString() + " / " + resultSet.getTime("dueTime")%></td>
									<%
										} else {
									%>
									<td>Not comfirm</td>
									<%
										}
									%>
									<td><%=resultSet.getDouble("deposit")%></td>
									<td><a href="#">detail</a></td>
								</tr>
								<%
									}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- /#page-content-wrapper -->

	</div>
	<!-- /#wrapper -->
</body>
</html>