<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*, dao.*, model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<Book> bookList = (ArrayList<Book>) (session.getAttribute("bookList"));
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
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
									String bookName = request.getParameter("bookName");
								BookDAO bookDAO = new BookDAO();
								ResultSet resultSet = bookDAO.searchBook(bookName);
								int i = 0;
								if (resultSet != null) {
									while (resultSet.next()) {
										i++;
								%>
								<tr>
									<td><%=i%></td>
									<td><%=resultSet.getString("name")%></td>
									<td><%=resultSet.getString("author")%></td>
									<td>
										<%
											boolean dup = false;
										for (int j = 0; j < bookList.size(); j++) {
											if (bookList.get(j).getId() == resultSet.getInt("id")) {
												dup = true;
												break;
											}
										}
										if(dup == false){
											%>
											 <a
										href="gdNhapsoluongsachmuon.jsp?bookId=<%=resultSet.getString("id")%>&&bookName=<%=resultSet.getString("name")%>">
										Select
										</a>
											<%
										}
										%>
									</td>
								</tr>
								<%
									}
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