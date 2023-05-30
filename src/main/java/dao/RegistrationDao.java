package dao;

import java.util.List;

import util.DaoHelper;
import vo.Course;
import vo.Dept;
import vo.Professor;
import vo.Registration;
import vo.Student;

public class RegistrationDao {

	private static RegistrationDao instance = new RegistrationDao();
	private RegistrationDao() {}
	public static RegistrationDao getinstance() {
		return instance;
	}
	
	public void insertRegistrationByCourseNoAndStudentId(int courseNo, String studentId) {
		DaoHelper.update("registrationDao.insertRegistrationByCourseNoAndStudentId", courseNo, studentId);
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
	
	public List<Student> getStudentsByCourseNoAndStatus(int courseNo, String status) {
		return DaoHelper.selectList("registrationDao.getStudentsByCourseNoAndStatus", rs -> {
			Student student = new Student(rs.getString("student_id"));
			student.setName(rs.getString("student_name"));
			student.setGrade(rs.getInt("student_grade"));
			student.setDept(new Dept(0, rs.getString("dept_name")));
			return student;
		}, courseNo, status);
	}
	
	public Registration getRegistrationByNoAndStudentId(int no, String studentId) {
		return DaoHelper.selectOne("getRegistrationByNoAndStudentId", rs -> {
			Registration registration = new Registration();
			registration.setCourse(new Course(rs.getInt("course_no")));
			registration.setStatus(rs.getString("reg_status"));
			return registration;
		}, no, studentId);
	}
	
	public Registration getRegistrationByCourseNoAndStudentId(int courseNo, String studentId) {
		return DaoHelper.selectOne("registrationDao.getRegistrationByCourseNoAndStudentId", rs -> {
			Registration registration = new Registration();
			registration.setNo(rs.getInt("reg_no"));
			registration.setStatus(rs.getString("reg_status"));
			return registration;
		}, courseNo, studentId);
	}
	public int countRegistrationsByCourseNoAndStudentId(int courseNo, String studentId) {
		return DaoHelper.selectOne("registrationDao.countRegistrationsByCourseNoAndStudentId", rs -> {
			return rs.getInt("cnt");
		}, courseNo, studentId);
	}
	
	public void updateRegistrationStatus(String status, int no) {
		DaoHelper.update("registrationDao.updateRegistrationStatus", status, no);
	}
	public void deleteOneRegistrationByCourseNoAndStudentId(int courseNo, String studentId) {
		DaoHelper.update("registrationDao.deleteOneRegistrationByCourseNoAndStudentId", courseNo, studentId);
	}
}
