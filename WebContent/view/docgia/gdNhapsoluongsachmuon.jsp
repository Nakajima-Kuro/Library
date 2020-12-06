<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*, dao.*, model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Book book = new Book();
book.setId(Integer.parseInt(request.getParameter("bookId")));
BookCopyDAO bookCopyDAO = new BookCopyDAO();
int num = bookCopyDAO.getNumOfAvaBook(book);
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
						<div class="my-auto">Choose your amount</div>
					</div>
					<div class="card-body">
						<form action="gdThemdonmuon.jsp" method="POST">
							<div class="form-group">
								<input type="hidden" name="bookId"
									value="<%=request.getParameter("bookId")%>"> 
									<input
									type="text" class="form-control" name="bookName"
									value="<%=request.getParameter("bookName")%>"
									placeholder="Choose your amount" disabled="disabled"> 
									<%if(num > 0){ %>
									<input
									type="number" class="form-control mt-4" name="amount"
									placeholder="Choose your amount" required="required" min="1" max="<%=num %>">
									<small id="emailHelp" class="form-text text-muted"><%= num %> copy are avalible at the library</small>
									<%} else { %>
									<input
									type="number" class="form-control mt-4" name="amount"
									placeholder="Out of stock" disabled="disabled">
									<small id="emailHelp" class="form-text text-muted">Sorry, there is no copy left at the library</small>
									<%} %>
							</div>
							<div class="row">
								<div class="col-2">
									<input type="submit" value="Confirm"
										class="list-group-item list-group-item-action bg-light" <%if(num < 1){%><%="disabled"%><%}%>>
								</div>
								<div class="col-2 pl-3">
									<button class="list-group-item list-group-item-action bg-light"
										onclick="goBack()">Back</button>
								</div>
							</div>
						</form>
					</div>
				</div>

			</div>
		</div>
		<!-- /#page-content-wrapper -->

	</div>
	<!-- /#wrapper -->
	<script type="text/javascript">
		function goBack() {
			window.history.back();
		}
	</script>
</body>
</html>