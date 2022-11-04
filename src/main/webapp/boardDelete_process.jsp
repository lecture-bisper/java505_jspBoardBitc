<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-11-04
  Time: 오후 3:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%@ include file="dbconn.jsp"%>

<%
  request.setCharacterEncoding("utf-8");

  int idx = Integer.parseInt(request.getParameter("idx"));

  Connection conn = null;
  PreparedStatement pstmt = null;

  String query = "UPDATE t_board SET deleted_yn = 'Y' ";
  query += "WHERE idx = ? ";

  try {
    conn = DriverManager.getConnection(url, uid, upw);
    pstmt = conn.prepareStatement(query);
    pstmt.setInt(1, idx);
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





