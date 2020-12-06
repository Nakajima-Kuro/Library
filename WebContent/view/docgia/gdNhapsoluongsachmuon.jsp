<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<% %>
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
							<input type="hidden" name="bookId" value="<%=request.getParameter("bookId")%>">
							<input type="text" class="form-control" name="bookName" value="<%=request.getParameter("bookName") %>"
									placeholder="Choose your amount" disabled="disabled">
								
							<input type="text" class="form-control mt-4" name="amount"
									placeholder="Choose your amount" required="required">
							</div>
							<div class="row">
								<div class="col-2">
									<input type="submit" value="Confirm"
										class="list-group-item list-group-item-action bg-light">
								</div>
								<div class="col-2 pl-3">
									<button 
										class="list-group-item list-group-item-action bg-light" onclick="goBack()">Back</button>
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