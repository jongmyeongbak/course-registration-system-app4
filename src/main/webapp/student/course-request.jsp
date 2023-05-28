<%@page import="vo.Course"%>
<%@page import="dao.CourseDao"%>
<%@page import="vo.Registration"%>
<%@page import="dao.RegistrationDao"%>
<%@page import="util.StringUtils"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
// 과정 신청을 처리한다.
	String loginId = (String) session.getAttribute("loginId");
	if (loginId == null) {
		response.sendRedirect("../loginform.jsp?err=req&job=" + URLEncoder.encode("수강신청", "utf-8"));
		return;
	}
	String loginType = (String) session.getAttribute("loginType");
	if (!"STUDENT".equals(loginType)) {
		response.sendRedirect("../home.jsp?err=deny&job=" + URLEncoder.encode("수강신청", "utf-8"));
		return;
	}
	
	int cno = StringUtils.stringToInt(request.getParameter("cno"));
	CourseDao courseDao = new CourseDao();
	Course course = courseDao.getCourseReqCnt(cno);
	if (course.getQuota() <= course.getReqCnt()) { // 신청 전에 자리 없음
		response.sendRedirect("course-registration-list.jsp&err=quota");
		return;
	}
	courseDao.increaseCourseReqCnt(cno);
	course = courseDao.getCourseReqCnt(cno);
	if (course.getQuota() < course.getReqCnt()) { // 신청 후에 정원 초과
		courseDao.decreaseCourseReqCnt(cno);
		response.sendRedirect("course-registration-list.jsp&err=quota");
		return;
	}
	
	int regNo = StringUtils.stringToInt("regNo"); // regNo가 0이 아니면 재신청시도. 0이면 재신청여부 판단필요
	RegistrationDao registrationDao = new RegistrationDao();
	Registration registration = registrationDao.getRegistrationByCourseNoAndStudentId(cno, loginId);
	if (regNo != 0) {
		if (registration == null || registration.getNo() != regNo) {
			courseDao.decreaseCourseReqCnt(cno);
			response.sendRedirect("course-registration-list.jsp&err=deny");
			return;
		}
	} else if (registration != null) { // 판단 결과 재신청
	regNo = registration.getNo(); // regNo가 0이 아니도록 실제 값을 저장함.
	}
	
	if (regNo == 0) { // 첫 신청
		registrationDao.insertRegistrationByCourseNoAndStudentId(cno, loginId);
		if (registrationDao.countRegistrationsByCourseNoAndStudentId(cno, loginId) > 1) { // 중복신청
			registrationDao.deleteOneRegistrationByCourseNoAndStudentId(cno, loginId);
			courseDao.decreaseCourseReqCnt(cno);
		}
	} else { // 재신청
		if ("신청완료".equals(registration.getStatus())) { // 이미 신청완료
			courseDao.decreaseCourseReqCnt(cno);
		} else {
		registrationDao.updateRegistrationStatus("신청완료", regNo);
		}
	}
	
	response.sendRedirect("course-registration-list.jsp");
%>