<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-11-04
  Time: 오전 9:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>디버그 툴 사용하기</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
          crossorigin="anonymous"></script>
</head>
<body>
<div class="container mt-5">
  <div class="row">
    <div class="col-6 mx-auto">
      <form action="debugTest_process.jsp" method="get">
        <div class="my-3">
          <label for="num1" class="form-label">첫번째 숫자 : </label>
          <input type="text" class="form-control" id="num1" name="number1" value="">
        </div>
        <div class="my-3">
          <label for="num2" class="form-label">두번째 숫자 : </label>
          <input type="text" class="form-control" id="num2" name="number2" value="">
        </div>
        <hr>
        <div class="d-grid gap-3">
          <button class="btn btn-primary" type="submit">계산</button>
        </div>
      </form>
    </div>
  </div>
</div>
</body>
</html>






