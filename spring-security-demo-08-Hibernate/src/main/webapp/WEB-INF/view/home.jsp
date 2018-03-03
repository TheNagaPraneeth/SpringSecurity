<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
  
<html>
<head>
<title>Dunnala Home Page</title>
</head>

<body>
	<h2>Dunnala Home Page</h2>
	<hr>
	Welcome to the Dunnala Home Page
	
	<p>
	Welcome to Naga Praneeth Dunnala Home Page!!!
	</p>
	
	<hr>
	<!-- display user name and role -->
	
	<p>
		User: <security:authentication property="principal.username" />
		<br><br>
		Role(s): <security:authentication property="principal.authorities"/>
	
	</p>
	
	<hr>
	
	<security:authorize access="hasRole('MANAGER')">
	<!-- Add a link to point to /leaders this page is for managers -->
	
	<p>
		<a href="${pageContext.request.contextPath}/leaders">LeaderShip Meeting</a>
		(Only for Manager peeps)		
	</p>
	</security:authorize>
	
	<security:authorize access="hasRole('ADMIN')">
	<!-- Add a link to point to /systems ..this is for the admins -->
	<p>
		<a href="${pageContext.request.contextPath}/admins">IT Systems Meeting</a>
		(Only for Admin peeps)
	</p>
	</security:authorize>
	<!-- Add a logout button -->
	<form:form action="${pageContext.request.contextPath}/logout" method="post">
		<input type="submit" value="Logout" />
	</form:form>
	
</body>
</html>