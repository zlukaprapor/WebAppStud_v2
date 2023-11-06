<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="styles.css">
    <title>JSP Page</title>

</head>
<body>
<div id="page">
    <h1>Student Form</h1>
    <form method="post" action="${pageContext.request.contextPath}/student-registration">
        <table>
            <tbody>
            <tr>
                <td><label for="name">Name</label></td>
                <td><input id="name" type="text" name="name"></td>
            </tr>
            <tr>
                <td><label for="surname">Surname</label></td>
                <td><input id="surname" type="text" name="surname"></td>
            </tr>
            <tr>
                <td><label for="email">Email</label></td>
                <td><input id="email" type="email" name="email"></td>
            </tr>
            <tr>
                <td><label for="group">Group</label></td>
                <td><input id="group" type="text" name="group"></td>
            </tr>
            <tr>
                <td><label for="faculty">Faculty</label></td>
                <td><input id="faculty" type="text" name="faculty"></td>
            </tr>
            </tbody>
        </table>
        <input type="submit" name="send" value="Send">
    </form>
    <c:if test="${not empty requestScope.error}">
        <div class="error" style="color: #ff0000">
              ${requestScope.error}
        </div>
    </c:if>
    <h1>Student List</h1>
    <table class="list">
        <tr>
            <th>Name</th>
            <th>Surname</th>
            <th>Email</th>
            <th>Group</th>
            <th>Faculty</th>
        </tr>

        <c:forEach items="${students}" var="student">
            <tr>
                <td>${student.name}</td>
                <td>${student.surname}</td>
                <td>${student.email}</td>
                <td>${student.group}</td>
                <td>${student.faculty}</td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>