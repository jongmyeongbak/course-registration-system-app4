<%@page import="vo.Student"%>
<%@page import="dao.StudentDao"%>
<%@page import="util.StringUtils"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 학생으로 회원가입 시킨다.
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	int grade = StringUtils.stringToInt(request.getParameter("grade"));
	int deptNo = StringUtils.stringToInt(request.getParameter("deptNo"));
	if (id.isBlank() || password.isBlank() || name.isBlank()) {
		response.sendRedirect("form.jsp?err=empty");
		return;
	}
	
	StudentDao studentDao = new StudentDao();
	if (id.equals(studentDao.getStudent(id).getId())) {
		response.sendRedirect("form.jsp?err=dup");
		return;
	}
	
	Student student = new Student(id);
	student.setPassword(password);
	student.setName(name);
	student.setGrade(grade);
	student.setDept(deptNo);
	studentDao.insertStudent(student);

	response.sendRedirect("../home.jsp");
%>