<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Lottery Login</title>
</head>
<link rel='stylesheet' href='css/lottery-custom.css' type="text/css">
<body>
	<div>
		<c:if test="${not empty error}">
			<div class="errorMessage">
				<c:out value="${error}" />
			</div>
		</c:if>
		<form action="<c:url value="/login.do" />" method="post">
			<div class="loginUserName">
				<label class="loginText">User Name:</label>
				<input class="input_user" type="text" name="userName" />
			</div>
			<div class="loginPassword">
				<label class="loginText">Password:</label>
				<input class="input_pw" type="password" name="password" />
			</div>
			<div>
				<input class="loginSubmitBtn" type="submit" value="Submit" />
				<input class="loginClearBtn" type="reset" value="Clear" />
			</div>	
		</form>
	</div>
</body>
</html>