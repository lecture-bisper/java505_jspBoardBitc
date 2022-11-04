<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-11-04
  Time: 오전 11:35
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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
          crossorigin="anonymous"></script>

  <script>
    $(document).ready(function () {
      $('#btn-back').on('click', function () {
        history.back();
      });

      $('#btn-delete').on('click', function () {
        let datas = {idx: $('#idx').val(), pwd: $('#pwd').val()};
        $.ajax({
          url: "pwdCheck.jsp",
          type: "post",
          data: datas,
          success: function(data) {
            data = JSON.parse(data);

            if (data.result == "success") {
              const frm = $('#frm');
              frm.submit();
            }
            else {
              alert('비밀번호가 틀렸습니다.');
            }
          },
          error: function () {
            alert("통신 오류");
          }
        });
      });
    });
  </script>
</head>
<body>
<%
  int idx = Integer.parseInt(request.getParameter("idx"));
%>
<%@ include file="header.jsp"%>

<main class="container mt-5">
  <div class="row">
    <div class="col-sm-6 mx-auto">
      <form action="boardDelete_process.jsp" method="get" id="frm">
        <div class="my-3">
          <label for="idx" class="form-label">삭제 비밀번호 : </label>
          <input type="password" class="form-control" id="pwd" placeholder="삭제 비밀번호를 입력해주세요">
        </div>
        <div class="my-3">
          <div class="row">
            <div class="col-sm d-grid gap-2">
              <input type="hidden" id="idx" name="idx" value="<%=idx%>">
              <button type="button" class="btn btn-danger" id="btn-delete">삭제하기</button>
            </div>
            <div class="col-sm d-grid gap-2">
              <button type="button" class="btn btn-secondary" id="btn-back">돌아가기</button>
            </div>
          </div>
        </div>
      </form>
    </div>
  </div>
</main>

<%@ include file="footer.jsp"%>
</body>
</html>






