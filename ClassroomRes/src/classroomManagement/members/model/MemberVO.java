package classroomManagement.members.model;

public class MemberVO {
	
	private String stdId;
	private String id;
	private String pw;
	private String name;
	private String email;
	private String phone;
	
	public MemberVO() {}

	public MemberVO(String stdId, String id, String pw, String name, String email, String phone) {
		super();
		this.stdId = stdId;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.phone = phone;
	}
	
	public String getStdId() {
		return stdId;
	}
	
	public void setStdId(String stdId) {
		this.stdId = stdId;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
}
