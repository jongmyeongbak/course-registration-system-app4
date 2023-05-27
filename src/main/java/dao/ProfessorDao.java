package dao;

import util.DaoHelper;
import vo.Professor;

public class ProfessorDao {

	public void insertProfessor(Professor professor) {
		DaoHelper.update("professorDao.insertProfessor", professor.getId(),
													professor.getPassword(),
													professor.getName(),
													professor.getPosition(),
													professor.deptNo());
	}
	
	public Professor getProfessor(String id) {
		return DaoHelper.selectOne("professorDao.getProfessor", rs -> {
			Professor professor = new Professor(id);
			professor.setPassword(rs.getString("professor_password"));
			professor.setName(rs.getString("professor_name"));
			professor.setPosition(rs.getString("professor_position"));
			professor.setDept(rs.getInt("dept_no"));
			return professor;
		}, id);
	}
}
