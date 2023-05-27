<%@page import="dao.ProfessorDao"%>
<%@page import="vo.Professor"%>
<%@page import="dao.StudentDao"%>
<%@page import="vo.Student"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 로그인처리
	String type = request.getParameter("type");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	if (id.isBlank() || password.isBlank()) {
		response.sendRedirect("loginform.jsp?err=empty");
		return;
	}
	
	if (type.equals("STUDENT")) {
		Student student = new StudentDao().getStudent(id);
		if (student == null || !student.getPassword().equals(password)) {
			response.sendRedirect("loginform.jsp?err=fail");
			return;
		}
	} else if (type.equals("PROFESSOR")) {
		Professor professor = new ProfessorDao().getProfessor(id);
		if (professor == null || !professor.getPassword().equals(password)) {
			response.sendRedirect("loginform.jsp?err=fail");
			return;
		}
	}
	session.setAttribute("loginType", type);
	session.setAttribute("loginId", id);
	
	response.sendRedirect("home.jsp");
%>