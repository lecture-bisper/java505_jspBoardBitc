<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-11-04
  Time: 오전 11:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%
  String fileName = request.getServletPath();
  fileName = fileName.substring(1);
  String boardTitle = "";

  switch (fileName) {
    case "boardList.jsp":
      boardTitle = "게시판 목록 페이지";
      break;

    case "boardDetail.jsp":
      boardTitle = "게시글 확인 페이지";
      break;

    case "boardWrite.jsp":
      boardTitle = "게시글 등록 페이지";
      break;

    case "boardUpdate.jsp":
      boardTitle = "게시글 수정 페이지";
      break;

    case "boardDelete.jsp":
      boardTitle = "게시글 삭제 페이지";
      break;
  }
%>

<header class="container mt-3">
  <div class="p-5 mb-4 bg-light rounded-3">
    <div class="container-fluid py-4">
      <h1><%=boardTitle%></h1>
    </div>
  </div>
</header>





