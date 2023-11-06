<%--
  Created by IntelliJ IDEA.
  User: Oleksii
  Date: 11/6/2023
  Time: 00:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Student List</title>
</head>
<body>
<h1>Student List</h1>
<table class="list">
    <tr>
        <th>Name</th>
        <th>Surname</th>
        <th>Email</th>
    </tr>

    <c:forEach items="${students}" var="student">
        <tr>
            <td>${student.name}</td>
            <td>${student.surname}</td>
            <td>${student.email}</td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
