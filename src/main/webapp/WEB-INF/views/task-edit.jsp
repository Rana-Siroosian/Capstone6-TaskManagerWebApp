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
				<form method="post">
				
					<section class="jumbotron">
						<h1>Your Tasks</h1>
					</section>
					<section class="container">
					<table class="table table-striped">
					  <tr>
					      <th>Task</th>
					    <th>Task Description</th>
					    <th>Task Due Date</th>
					    <th>Task Status</th>
					    
					       <th>Action</th>
					     
					   	<input type="hidden" name="employee" value= "${ employee.id }">
					    
					  </tr>
					  <c:forEach var="task" items="${ employee.tasks }">
						<tr>
							<td>${ task.task }</td>
							<td>${ task.taskDescription }</td>
							<td>${ task.date }</td>
							<td>${ task.status ? "Completed" : "Not Completed" }</td>
							<td>
							<label>Completed:<input type="radio" name="status" value="true" ></label>
						<label>Not Completed:<input type="radio" name="status" value="false" ></label></td>
							</tr>
							</c:forEach>
							</table></section>
					<a href="/employee/${ employee.id }/status/${ task.id}"><button type="submit" onclick="return confirm('Do you want to apply changes?')" class="btn btn-primary">Submit</button></a>
				</form>
				
			</main>
</body>
</html>