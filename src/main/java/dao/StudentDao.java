package dao;

import util.DaoHelper;
import vo.Student;

public class StudentDao {

	public void insertStudent(Student student) {
		DaoHelper.update("studentDao.insertStudent", student.getId(),
													student.getPassword(),
													student.getName(),
													student.getGrade(),
													student.deptNo());
	}
	
	public Student getStudent(String id) {
		return DaoHelper.selectOne("studentDao.getStudent", rs -> {
			Student student = new Student(rs.getString("student_id"));
			student.setPassword(rs.getString("student_password"));
			student.setName(rs.getString("student_name"));
			student.setGrade(rs.getInt("student_grade"));
			student.setDept(rs.getInt("dept_no"));
			return student;
		}, id);
	}
}