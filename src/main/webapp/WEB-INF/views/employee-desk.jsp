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
				<main>
				<form class="container">
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
				     
				   	<label><input type="hidden" name="employee" value= "${ employee.id }"></label>
				    
				  </tr>
				  <c:forEach var="task" items="${ employee.tasks }">
				  <tr>
				    <td ${task.id}">${ task.task } </td>
				    <td>${ task.taskDescription }</td><td>${ task.date }</td><td>${ task.status } </td>
				     <td>
				    
					 <a href="/employee/${ employee.id }/status/${ task.id}" name="id"class="btn btn-info">Edit</a>
					<a href="/employee/${ employee.id }/delete/${ task.id }" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this?')"> Delete</a>
					</td>
					</tr>
				  </c:forEach>
				</table>
				
				<a href="/employee/${ employee.id }/addt" class="btn btn-primary">Add Task</a>
				</section>
				</form>
				</main>
</body>
</html>