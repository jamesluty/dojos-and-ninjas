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
    <title>Dojos and Ninjas</title>
</head>
<body>
	<div class="dojoWrapper">
		<h1>All Dojos</h1>
		<ul>
			<c:forEach var="dojo" items="${allDojos }">
				<li><a href="/dojos/${dojo.id}">${dojo.name }</a></li>
			</c:forEach>
		</ul>
	    <h1>New Dojo</h1>
	    <form:form class="dojoForm" action="/dojos/create" method="post" modelAttribute="dojo">
	    	<div>
		    	<form:label path="name">Name: </form:label>
		    	<form:input path="name"/>
	    	</div>
    		<form:errors class="errors" path="name"/>
	    	<div class="btnDiv">
		    	<button class="btn btn-primary">Create Dojo</button>
	    	</div>
	    </form:form>
	    <a class="btn btn-success" href="/ninjas/new">Create Ninja</a>
	</div>
</body>
</html>