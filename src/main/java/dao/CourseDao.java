package dao;

import java.util.List;

import util.DaoHelper;
import vo.Course;
import vo.Dept;
import vo.Professor;

public class CourseDao {

	private static CourseDao instance = new CourseDao();
	private CourseDao() {}
	public static CourseDao getInstance() {
		return instance;
	}
	
	public void insertCourse(Course course) {
		DaoHelper.update("courseDao.insertCourse", course.getName(),
												course.getType(),
												course.getScore(),
												course.getQuota(),
												course.getDescription(),
												course.deptNo(),
												course.professorId());
	}
	
	public int getTotalRows() {
		return DaoHelper.selectOne("courseDao.getTotalRows", rs -> {
			return rs.getInt("cnt");
		});
	}
	public int getTotalRowsByProfessorId(String professorId) {
		return DaoHelper.selectOne("courseDao.getTotalRowsByProfessorId", rs -> {
			return rs.getInt("cnt");
		}, professorId);
	}
	
	public List<Course> getCourses(int first, int last) {
		return DaoHelper.selectList("courseDao.getCourses", rs -> {
			Course course = new Course(rs.getInt("course_no"));
			course.setName(rs.getString("course_name"));
			course.setQuota(rs.getInt("course_quota"));
			course.setReqCnt(rs.getInt("course_req_cnt"));
			course.setDept(new Dept(0, rs.getString("dept_name")));
			course.setProfessor(new Professor(null, rs.getString("professor_name")));
			return course;
		}, first, last);
	}
	public List<Course> getCoursesByProfessorId(String professorId, int first, int last) {
		return DaoHelper.selectList("courseDao.getCoursesByProfessorId", rs -> {
			Course course = new Course(rs.getInt("course_no"));
			course.setName(rs.getString("course_name"));
			course.setType(rs.getString("course_type"));
			course.setQuota(rs.getInt("course_quota"));
			course.setReqCnt(rs.getInt("course_req_cnt"));
			course.setDept(new Dept(0, rs.getString("dept_name")));
			return course;
		}, professorId, first, last);
	}
	
	public Course getCourseByNo(int no) {
		return DaoHelper.selectOne("courseDao.getCourseByNo", rs -> {
			Course course = new Course();
			course.setName(rs.getString("course_name"));
			course.setType(rs.getString("course_type"));
			course.setScore(rs.getInt("course_score"));
			course.setQuota(rs.getInt("course_quota"));
			course.setReqCnt(rs.getInt("course_req_cnt"));
			course.setDescription(rs.getString("course_description"));
			course.setDept(new Dept(0, rs.getString("dept_name")));
			course.setProfessor(new Professor(null, rs.getString("professor_name")));
			return course;
		}, no);
	}
	
	public Course getCourseReqCnt(int courseNo) {
		return DaoHelper.selectOne("courseDao.getCourseReqCnt", rs -> {
			Course course = new Course();
			course.setQuota(rs.getInt("course_quota"));
			course.setReqCnt(rs.getInt("course_req_cnt"));
			return course;
		}, courseNo);
	}
	public void increaseCourseReqCnt(int courseNo) {
		DaoHelper.update("courseDao.increaseCourseReqCnt", courseNo);
	}
	public void decreaseCourseReqCnt(int courseNo) {
		DaoHelper.update("courseDao.decreaseCourseReqCnt", courseNo);
	}
}
