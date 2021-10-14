<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
	<head>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
		<meta charset="ISO-8859-1">
		<title> BOOK CLUB </title>
	</head>
	<body class="p-3 bg-secondary text-light">
		<div class="container">
			<div class="d-flex flex-row justify-content-between">
				<h1 class="display-4"> <c:out value="${ book.title }" /> </h1>
				<a href="/bookclub/dashboard" class="link link-light mt-4">back to the shelves</a>
			</div>
			<div class="d-flex flex-column">
				<h3 class="mt-4 text-dark">
					<span class="text-info fw-bold" style=": 1px 1px whitesmoke;"> <c:out value="${ book.user.firstName }" /> </span> read <span class="text-info fw-bold"> <c:out value="${ book.title }" /> </span> by <span class="text-info fw-bold"> <c:out value="${ book.author }" /> </span>. 
				</h3>
				<h5 class="mt-3 my-5 text-dark">Here are <c:out value="${ book.user.firstName }" />'s thoughts:</h5>
				<div class="ms-3 py-3 border-top border-bottom border-dark" style="width: 70%;">
					<p class="fst-italic"><c:out value="${ book.myThoughts }" /></p>
				</div>
				<div class="d-flex flex-row justify-content-end pe-5 mt-3" style="width: 77%;">
					<a href="/bookclub/books/${ book.id }/edit" class="btn btn-sm btn-primary align-self-end" style="width: 60px;">Edit</a>
					<form action="/bookclub/books/${ book.id }/delete" method="post">
						<input type="hidden" name="_method" value="delete">
						<input type="submit" class="btn btn-sm btn-outline-danger ms-3 text-light" value="Delete"/>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>