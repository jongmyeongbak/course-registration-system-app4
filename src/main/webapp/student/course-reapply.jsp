<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 과정 재신청을 처리하세요.
	String cno = request.getParameter("cno");
	String regNo = request.getParameter("regNo");
	response.sendRedirect("course-reapply.jsp?cno=" + cno + "&regNo=" + regNo);
%>