<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <title>Dojo Details</title>
</head>
<body>
	<div class="showWrapper">
	    <h1>${dojo.name } Location Ninjas</h1>
	    <table class="table table-striped table-bordered w-50">
	    	<thead>
	    		<tr>
	    			<th>First Name</th>
	    			<th>Last Name</th>
	    			<th>Age</th>
	    		</tr>
	    	</thead>
	    	<tbody>
	    		<c:forEach var="ninja" items="${dojo.ninjas }">
	    			<tr>
	    				<td>${ninja.firstName }</td>
	    				<td>${ninja.lastName }</td>
	    				<td>${ninja.age }</td>
	    			</tr>
	    		</c:forEach>
	    	</tbody>
	    </table>
	    
	    <a class="btn btn-success" href="/dojos/new">Home</a>
	</div>
</body>
</html>