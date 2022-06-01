<%--
  Created by IntelliJ IDEA.
  User: nasty
  Date: 2022/05/24
  Time: 13:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
pageEncoding ="UTF-8" %>
<html>
<head>
    <title>NAS</title>
</head>
<body>
  <%
    session.invalidate();
  %>
<script>
  alert("로그아웃 되었습니다.");
  location.href = "main.jsp";
</script>

</body>
</html>
