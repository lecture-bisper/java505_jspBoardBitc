<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-11-04
  Time: 오후 2:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%@ include file="dbconn.jsp"%>

<%
  request.setCharacterEncoding("utf-8");

  String title = request.getParameter("title");
  String contents = request.getParameter("contents");
  String userId = request.getParameter("userId");
  String userPw = request.getParameter("pwd");
%>

<%
  Connection conn = null;
  PreparedStatement pstmt = null;

  String query = "INSERT INTO t_board (title, contents, user_id, pwd, create_dt) ";
  query += "VALUES (?,?,?,?,now()) ";

  try {
    conn = DriverManager.getConnection(url, uid, upw);
    pstmt = conn.prepareStatement(query);
    pstmt.setString(1, title);
    pstmt.setString(2, contents);
    pstmt.setString(3, userId);
    pstmt.setString(4, userPw);
    pstmt.executeUpdate();
  }
  catch (SQLException e) {
    out.print(e.getMessage());
  }
  finally {
    if (pstmt != null) { pstmt.close(); }
    if (conn != null) { conn.close(); }
  }

  response.sendRedirect("boardList.jsp");
%>






