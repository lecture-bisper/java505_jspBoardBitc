<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-11-04
  Time: 오전 9:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Title</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
          crossorigin="anonymous"></script>
</head>
<body>
<%!
  int sum(String num1, String num2) {
    int result = 0;

    int number1 = Integer.parseInt(num1);
    int number2 = Integer.parseInt(num2);
    result = number1 + number2;

    return result;
  }
%>
<%
  request.setCharacterEncoding("utf-8");

  String strNum1 = request.getParameter("number1");
  String strNum2 = request.getParameter("number2");

  int result = sum(strNum1, strNum2);

//  int num1 = Integer.parseInt(strNum1);
//  int num2 = Integer.parseInt(strNum2);
//
//  int result = num1 + num2;

  out.print("두 수의 합은 " + result);
%>
</body>
</html>






