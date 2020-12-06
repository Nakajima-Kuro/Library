<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*, model.*, dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<!-- Code in here -->
				<div class="card mt-3">
					<div class="card-header d-flex justify-content-between">
						<div class="my-auto">New Borrow Form</div>
					</div>
					<div class="card-body">
						<%
							ArrayList<Book> bookList = (ArrayList<Book>) (session.getAttribute("bookList"));
						ArrayList<Integer> amountList = (ArrayList<Integer>) (session.getAttribute("amountList"));

						if (request.getParameter("new") != null && request.getParameter("new").equals("true")) {
							bookList = new ArrayList<>();
							amountList = new ArrayList<>();
						}

						if (request.getParameter("bookId") != null && request.getParameter("amount") != null) {
							BookDAO bookDAO = new BookDAO();

							//Add new book to bookList
							Book book = bookDAO.getBookById(request.getParameter("bookId"));
							bookList.add(book);

							//Add new amount to amountList
							int amount = Integer.parseInt(request.getParameter("amount"));
							amountList.add(amount);
						}

						if (request.getParameter("removeId") != null) {
							int id = Integer.parseInt(request.getParameter("removeId"));
							bookList.remove(id);
							amountList.remove(id);
						}

						session.setAttribute("bookList", bookList);
						session.setAttribute("amountList", amountList);
						%>
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">#</th>
									<th scope="col">Book name</th>
									<th scope="col">Author</th>
									<th scope="col">Amount</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
									for (int i = 0; i < amountList.size(); i++) {
								%>
								<tr>
									<td><%=i + 1%></td>
									<td><%=bookList.get(i).getName()%></td>
									<td><%=bookList.get(i).getAuthor()%></td>
									<td><%=amountList.get(i)%></td>
									<td><a href="gdThemdonmuon.jsp?removeId=<%=i%>">Remove</a></td>
								</tr>
								<%
									}
								%>

							</tbody>
						</table>
					</div>
					<div class="card-footer d-flex justify-content-between">
						<a href="gdTimkiemsach.jsp"
							class="list-group-item list-group-item-action bg-light mx-2">Add
							book</a> <a href="doSaveBorrowForm.jsp"
							class="list-group-item list-group-item-action bg-light mx-2">Confirm</a>
						<a href="gdDanhsachDonmuon.jsp"
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