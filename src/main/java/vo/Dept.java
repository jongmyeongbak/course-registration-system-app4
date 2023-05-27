package vo;

public class Dept {

	private int no;
	private String name;
	
	public Dept() {
	}
	public Dept(int no) {
		super();
		this.no = no;
	}
	public Dept(int no, String name) {
		super();
		this.no = no;
		this.name = name;
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