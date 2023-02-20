<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
	<head>
		<meta charset="utf-8">
		<title>Dilip</title>
	</head> 
	<center><h1>Hello!</h1></center>
	<body>
		<centre><p>Apache Tomcat is a free and open-source implementation of the Jakarta Servlet, Jakarta Expression Language, and WebSocket technologies. It provides a "pure Java" HTTP web server environment in which Java code can also run. Thus it is a Java web application server, although not a full JEE application server.</p>
		<c:url value="/showMessage.html" var="messageUrl" />
		<a href="${messageUrl}"></a><br>
		<br><c:url value="/showMessage.html" var="messageUrl" />
		<a href="${messageUrl}"></a>
	</body>
</html>
