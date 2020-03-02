<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://stackpath.bootstrapcdn.com/bootswatch/4.4.1/cyborg/bootstrap.min.css" rel="stylesheet" integrity="sha384-l7xaoY0cJM4h9xh1RfazbgJVUZvdtyLWPueWNtLAphf/UbBgOVzqbOTogxPwYLHM" crossorigin="anonymous">
</head>
<body>
			<%@ include file="partials/header.jsp" %>
			<main class="container">
				<section class="jumbotron">
					<h3>Thank you for registering with us, ${ name }</h3>
				</section>
				<a href="/home"><button type="submit" class="btn btn-primary">Home Page</button></a>
			</main>
		
</body>
</html>