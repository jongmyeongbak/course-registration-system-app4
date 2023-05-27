package dao;

import java.util.List;

import util.DaoHelper;
import vo.Dept;

public class DeptDao {

	public List<Dept> getDepts() {
		return DaoHelper.selectList("deptDao.getDepts", rs -> {
			Dept dept = new Dept(rs.getInt("dept_no"), rs.getString("dept_name"));
			return dept;
		});
	}
}
