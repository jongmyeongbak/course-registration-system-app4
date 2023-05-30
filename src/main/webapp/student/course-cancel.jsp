<%@page import="dao.CourseDao"%>
<%@page import="vo.Registration"%>
<%@page import="dao.RegistrationDao"%>
<%@page import="util.StringUtils"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 수강취소 처리를 한다.
	String loginId = (String) session.getAttribute("loginId");
	if (loginId == null) {
		response.sendRedirect("../loginform.jsp?err=req&job=" + URLEncoder.encode("수강취소", "utf-8"));
		return;
	}
	String loginType = (String) session.getAttribute("loginType");
	if (!"STUDENT".equals(loginType)) {
		response.sendRedirect("../home.jsp?err=deny&job=" + URLEncoder.encode("수강취소", "utf-8"));
		return;
	}
	
	int regNo = StringUtils.stringToInt(request.getParameter("regNo"));
	if (regNo == 0) {
		response.sendRedirect("course-registration-list.jsp");
	}
	
	RegistrationDao registrationDao = RegistrationDao.getinstance();
	Registration registration = registrationDao.getRegistrationByNoAndStudentId(regNo, loginId);
	if (registration == null) {
		response.sendRedirect("course-registration-list.jsp&err=deny");
		return;
	}
	
	if ("신청완료".equals(registration.getStatus())) {
		registrationDao.updateRegistrationStatus("신청취소", regNo);
		CourseDao.getInstance().decreaseCourseReqCnt(registration.courseNo());
	}
	response.sendRedirect("course-registration-list.jsp");
%>