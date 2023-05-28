package dao;

import java.util.List;

import util.DaoHelper;
import vo.Course;
import vo.Dept;
import vo.Professor;
import vo.Registration;

public class RegistrationDao {

	public void insertRegistrationByCourseNoAndStudentId(int no, String studentId) {
		DaoHelper.update("registrationDao.insertRegistrationByCourseNoAndStudentId", no, studentId);
	}
	
	public List<Registration> getRegistrationsByStudentId(String studentId) {
		return DaoHelper.selectList("registrationDao.getRegistrationsByStrudentId", rs -> {
			Registration registration = new Registration();
			registration.setNo(rs.getInt("reg_no"));
			registration.setCourse(new Course(
					rs.getInt("course_no"),
					rs.getString("course_name"),
					new Dept(0, rs.getString("dept_name")),
					new Professor(null, rs.getString("professor_name"))
				));
			registration.setStatus(rs.getString("reg_status"));
			return registration;
		}, studentId);
	}
	
	public Registration getRegistrationByCourseNoAndStudentId(int no, String studentId) {
		return DaoHelper.selectOne("registrationDao.getRegistrationByCourseNoAndStudentId", rs -> {
			Registration registration = new Registration();
			registration.setNo(rs.getInt("reg_no"));
			registration.setStatus(rs.getString("reg_status"));
			return registration;
		}, no, studentId);
	}
	public int countRegistrationsByCourseNoAndStudentId(int no, String studentId) {
		return DaoHelper.selectOne("registrationDao.countRegistrationsByCourseNoAndStudentId", rs -> {
			return rs.getInt("cnt");
		}, no, studentId);
	}
	public void updateRegistrationStatus(String status, int no) {
		DaoHelper.update("registrationDao.updateRegistrationStatus", status, no);
	}
	public void deleteOneRegistrationByCourseNoAndStudentId(int no, String studentId) {
		DaoHelper.update("registrationDao.deleteOneRegistrationByCourseNoAndStudentId", no, studentId);
	}
}
