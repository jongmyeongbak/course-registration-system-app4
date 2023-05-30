<%@page import="dao.CourseDao"%>
<%@page import="vo.Professor"%>
<%@page import="vo.Dept"%>
<%@page import="vo.Course"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 신규 개설과정을 등록시킨다.
	String loginId = (String) session.getAttribute("loginId");
	if (loginId == null) {
		response.sendRedirect("../loginform.jsp?err=req&job=" + URLEncoder.encode("과정등록", "utf-8"));
		return;
	}
	String loginType = (String) session.getAttribute("loginType");
	if (!"PROFESSOR".equals(loginType)) {
		response.sendRedirect("../home.jsp?err-deny&job=" + URLEncoder.encode("과정등록", "utf-8"));
		return;
	}
	
	String name = request.getParameter("name");
	String type = request.getParameter("type");
	int score = Integer.parseInt(request.getParameter("score"));
	int quota = Integer.parseInt(request.getParameter("quota"));
	String description = request.getParameter("description");
	int deptNo = Integer.parseInt(request.getParameter("deptNo"));
	
	Course course = new Course();
	course.setName(name);
	course.setType(type);
	course.setScore(score);
	course.setQuota(quota);
	course.setDescription(description);
	course.setDept(new Dept(deptNo));
	course.setProfessor(new Professor(loginId));
	CourseDao.getInstance().insertCourse(course);
	
	response.sendRedirect("course-list.jsp");
%>