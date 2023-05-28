package dao;

import util.DaoHelper;
import vo.Registration;

public class RegistrationDao {

	public void insertRegistrationByCourseNoAndStudentId(int no, String studentId) {
		DaoHelper.update("registrationDao.insertRegistrationByCourseNoAndStudentId", no, studentId);
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
