package classroomManagement.board.model;


public class BoardVO {
	
	private String classno;
	private int people;
	private String projector;
	private String electricity;
	private String tv;
	private String computer;
	private String day;
	private int starttimeok;
	private int endtimeok;

	public BoardVO(String classno, int people, String projector,
			String electricity, String tv, String computer, String day, int starttimeok, int endtimeok) {
		super();
		this.classno = classno;
		this.people = people;
		this.projector = projector;
		this.electricity = electricity;
		this.tv = tv;
		this.computer = computer;
		this.day = day;
		this.starttimeok = starttimeok;
		this.endtimeok = endtimeok;
	}

	
	public String getDay() {
		return day;
	}


	public void setDay(String day) {
		this.day = day;
	}


	public String getClassno() {
		return classno;
	}


	public void setClassno(String classno) {
		this.classno = classno;
	}


	public int getPeople() {
		return people;
	}

	public void setPeople(int people) {
		this.people = people;
	}

	public String getProjector() {
		return projector;
	}

	public void setProjector(String projector) {
		this.projector = projector;
	}

	public String getElectricity() {
		return electricity;
	}

	public void setElectricity(String electricity) {
		this.electricity = electricity;
	}

	public String getTv() {
		return tv;
	}

	public void setTv(String tv) {
		this.tv = tv;
	}

	public String getComputer() {
		return computer;
	}

	public void setComputer(String computer) {
		this.computer = computer;
	}

	public int getStarttimeok() {
		return starttimeok;
	}

	public void setStarttimeok(int starttimeok) {
		this.starttimeok = starttimeok;
	}

	public int getEndtimeok() {
		return endtimeok;
	}

	public void setEndtimeok(int endtimeok) {
		this.endtimeok = endtimeok;
	}


}
