package dao;

import util.DaoHelper;
import vo.Course;

public class CourseDao {

	public void insertCourse(Course course) {
		DaoHelper.update("courseDao.insertCourse", course.getName(),
												course.getType(),
												course.getScore(),
												course.getQuota(),
												course.getDescription(),
												course.deptNo(),
												course.professorId());
	}
}
