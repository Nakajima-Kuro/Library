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
<title>Library - Librarian</title>
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
							ArrayList<BookBorrowFormDetail> listBorrowBook = new ArrayList<>();
						ArrayList<Book> listBook = new ArrayList<>();
						if (request.getParameter("securityId") != null) {
							Member reader = new Member();
							reader.setSecurityId(request.getParameter("securityId"));
							BookBorrowFormDetailDAO borrowDAO = new BookBorrowFormDetailDAO();
							ResultSet resultSet = borrowDAO.searchListBySecureId(reader);

							if (resultSet.next() != false) {
								ArrayList<BookBorrowFormDetail> listBookBorrow = new ArrayList<>();
								do {
							BookBorrowFormDetail bookBorrowFormDetail = new BookBorrowFormDetail(resultSet.getInt("id"),
									resultSet.getString("status"), resultSet.getInt("bookborrowFormId"),
									resultSet.getInt("bookCopyId"));
							listBorrowBook.add(bookBorrowFormDetail);

							Book book = new Book();
							book.setName(resultSet.getString("name"));
							book.setAuthor(resultSet.getString("author"));
							listBook.add(book);
								} while (resultSet.next());
							}

							session.setAttribute("listBorrowBook", listBorrowBook);
							session.setAttribute("listBook", listBook);
						} else {
							listBorrowBook = (ArrayList<BookBorrowFormDetail>) (session.getAttribute("listBorrowBook"));
							listBook = (ArrayList<Book>) (session.getAttribute("listBook"));
						}

						if (request.getParameter("giveBook") != null) {
							for (int i = 0; i < listBook.size(); i++) {
								if (listBook.get(i).getName().equals(request.getParameter("giveBook"))) {
							listBorrowBook.get(i).setStatus("borrowed");
								}
							}
						}
						%>
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">#</th>
									<th scope="col">Book name</th>
									<th scope="col">Author</th>
									<th scope="col">Amount</th>
									<th scope="col">Status</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
									int j = 1;
								int count = 1;
								for (int i = 0; i < listBook.size(); i++) {
									if (i == listBook.size() - 1 || !listBook.get(i).getName().equals(listBook.get(i + 1).getName())) {
								%>
								<tr>
									<td><%=j++%></td>
									<td><%=listBook.get(i).getName()%></td>
									<td><%=listBook.get(i).getAuthor()%></td>
									<td><%=count%></td>
									<td><%=listBorrowBook.get(i).getStatus()%></td>
									<td><a
										href="gdChitietSachmuon.jsp?bookName=<%=listBook.get(i).getName()%>">Detail</a></td>
								</tr>
								<%
									count = 1;
								} else {
								count++;
								}
								}
								%>

							</tbody>
						</table>
					</div>
					<div class="card-footer">
						<div class="row">
							<a href="doSaveBorrowBook.jsp"
								class="list-group-item list-group-item-action bg-light mx-2 col-4">Confirm</a>
							<a href="gdChinhThuthu.jsp"
								class="list-group-item list-group-item-action bg-light mx-2 col-4">Cancel</a>
							<div class="col">
								<%
									ArrayList<Integer> listFormId = new ArrayList<>();
								for (int i = 0; i < listBorrowBook.size(); i++) {
									if (i == 0 || listBorrowBook.get(i).getBookborrowFormId() != listBorrowBook.get(i - 1).getBookborrowFormId()) {
										listFormId.add(listBorrowBook.get(i).getBookborrowFormId());
									}
								}

								if (listFormId.size() != 0) {
									BookBorrowFormDAO bookBorrowFormDAO = new BookBorrowFormDAO();
									double sumDeposit = bookBorrowFormDAO.getTotalDeposit(listFormId);
								%>
								<p class="text-center mt-2">
									Total deposit: <span class="text-info"><%=sumDeposit%>đ</span>
								<p>
									<%
										}
									%>
								
							</div>
						</div>

					</div>
				</div>

			</div>
		</div>
		<!-- /#page-content-wrapper -->

	</div>
	<!-- /#wrapper -->
	<%
		if (request.getParameter("message") != null && request.getParameter("message").equals("notAllBookGiven")) {
	%>
	<!-- Modal -->
	<div class="modal fade" id="bookBorrowModal" tabindex="-1"
		role="dialog">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Not all book given to the reader</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">You need to give all book to reader before confirm</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		$('#bookBorrowModal').modal();
	</script>
	<%
		}
	%>
</body>
</html>