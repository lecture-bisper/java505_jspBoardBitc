<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-11-04
  Time: 오전 11:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
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

      $('#btn-update').on('click', function () {
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
  request.setCharacterEncoding("utf-8");
  int idx = Integer.parseInt(request.getParameter("idx"));
  String title = "";
  String contents = "";
  String userId = "";
  String userPw = "";
  int hitCnt = 0;
  String createDt = "";
  String updateDt = "";
%>

<%@ include file="dbconn.jsp"%>

<%
  Connection conn = null;
  Statement stmt = null;
  ResultSet rs = null;

  String query = "SELECT idx, title, contents, user_id, create_dt, update_dt, hit_cnt FROM t_board ";
  query += "WHERE deleted_yn = 'N' ORDER BY idx DESC ";

  try {
    conn = DriverManager.getConnection(url, uid, upw);
    stmt = conn.createStatement();
    rs = stmt.executeQuery(query);

    if (rs.next()) {
      idx = rs.getInt("idx");
      title = rs.getString("title");
      contents = rs.getString("contents");
      userId = rs.getString("user_id");
      createDt = rs.getString("create_dt");
      updateDt = rs.getString("update_dt");
      hitCnt = rs.getInt("hit-cnt");
    }
  }
  catch(SQLException e) {
    out.print(e.getMessage());
  }
  finally {
    if (rs != null) { rs.close(); }
    if (stmt != null) { stmt.close(); }
    if (conn != null) { conn.close(); }
  }
%>

<%@ include file="header.jsp"%>

<main class="container mt-5">
  <div class="row">
    <div class="col-sm-6 mx-auto">
      <form action="boardUpdate_process.jsp" method="post" id="frm">
        <div class="my-3">
          <label class="form-label" for="title">글제목 : </label>
          <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요" value="<%=title%>">
        </div>
        <div class="my-3">
          <label class="form-label" for="user-id">아이디 : </label>
          <input type="text" class="form-control" id="user-id" name="userId" placeholder="아이디를 입력하세요" disabled value="<%=userId%>">
        </div>
        <div class="my-3">
          <label class="form-label" for="pwd">비밀번호 : </label>
          <input type="password" class="form-control" id="pwd" name="pwd" placeholder="비밀번호를 입력하세요">
        </div>
        <div class="my-3">
          <label class="form-label" for="contents">글 내용 : </label>
          <textarea class="form-control" id="contents" name="contents" rows="10" placeholder="내용을 입력하세요"><%=contents%></textarea>
        </div>
        <div class="d-grid gap-2 my-3">
          <input type="hidden" id="idx" name="idx" value="<%=idx%>">
          <button class="btn btn-warning" type="button" id="btn-update">수정하기</button>
          <button class="btn btn-secondary" type="button" id="btn-back">돌아가기</button>
        </div>
      </form>
    </div>
  </div>
</main>

<%@ include file="footer.jsp"%>
</body>
</html>






