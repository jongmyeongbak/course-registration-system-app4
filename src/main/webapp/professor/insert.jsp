<%@page import="vo.Professor"%>
<%@page import="dao.ProfessorDao"%>
<%@page import="util.StringUtils"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 교수로 회원가입 시킨다.
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String position = request.getParameter("position");
	int deptNo = StringUtils.stringToInt(request.getParameter("deptNo"));
	if (id.isBlank() || password.isBlank() || name.isBlank()) {
		response.sendRedirect("form.jsp?err=empty");
		return;
	}
	
	ProfessorDao professorDao = ProfessorDao.getInstance();
	if (professorDao.getProfessor(id) != null) {
		response.sendRedirect("form.jsp?err=dup");
		return;
	}
	
	Professor professor = new Professor(id);
	professor.setPassword(password);
	professor.setName(name);
	professor.setPosition(position);
	professor.setDept(deptNo);
	professorDao.insertProfessor(professor);
	
	response.sendRedirect("../home.jsp");
%>