package vo;

public class Department {

	private int no;
	private String name;
	
	public Department() {
	}
	public Department(int no) {
		super();
		this.no = no;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}