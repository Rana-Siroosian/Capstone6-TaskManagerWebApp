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
					<form action="/employee/${ employee.id }/addt" method="post">
						<section class="jumbotron">
						<div>
							<div>
								<label>Task:<input type="text" name="task" required></label>
							</div>
							<div>
								<input type="hidden" name="id" value=" ${ employee.id }">
							</div>
							<div>
								<label>Task Description:<input type="text" name="taskDescription" required></label>
							</div>
							<div>
								<label>Due Date:<input type="date" name="date" required></label>
							</div>
							<div>
								<label>Completed:<input type="radio" name="status" value="true" ></label>
							</div>
							<div>
								<label>Not Completed:<input type="radio" name="status" value="false" ></label>
							</div>
						
							<input type="hidden" value="${ employee.username }" name="username">
						
							<button class="btn btn-primary" type="submit">Submit</button>
						</div>
						</section>
					</form>
				</main>
		
</body>
</html>