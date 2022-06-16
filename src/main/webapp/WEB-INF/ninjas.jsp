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
    <title>Create Ninja</title>
</head>
<body>
	<div class="ninjaWrapper">
		<div class="ninjaHeader">
		    <h1>New Ninja</h1>
		    <a href="/dojos/new">home</a>
		</div>
	    <form:form class="dojoForm" action="/ninjas/create" method="post" modelAttribute="ninja">
	    	<div class="formItem">
		    	<form:label path="firstName">First Name: </form:label>
		    	<form:input path="firstName"/>
	    	</div>
	    	<form:errors class="errors" path="firstName"/>
	    	<div class="formItem">
		    	<form:label path="lastName">Last Name: </form:label>
		    	<form:input path="lastName"/>
	    	</div>
	    	<form:errors class="errors" path="lastName"/>
	    	<div class="formItem">
		    	<form:label path="age">Age: </form:label>
		    	<form:input path="age"/>
	    	</div>
	    	<form:errors class="errors" path="age"/>
	    	<div class="formItem">
		    	<form:select path="dojo">
		    		<c:forEach var="dojo" items="${allDojos }">
		    			<form:option value="${dojo.id }">${dojo.name }</form:option>
		    		</c:forEach>
		    	</form:select>
	    	</div>
	    	<div>
		    	<button class="btn btn-primary">Create</button>
	    	</div>
	    </form:form>
	</div>
</body>
</html>