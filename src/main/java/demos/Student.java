package demos;

public class Student {
    int sid;
    String sname;
    String smail; 
    int sage;
    String sgender;
    String slocation;
    String scourses;
    String branch;

    public Student(int sid, String sname, String smail, int sage, String sgender, String slocation, String scourses,String branch) {
        this.sid = sid;
        this.sname = sname;
        this.smail = smail;
        this.sage = sage;
        this.sgender = sgender;
        this.slocation = slocation;
        this.scourses = scourses;
        this.branch = branch;
    }

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getSmail() {
		return smail;
	}

	public void setSmail(String smail) {
		this.smail = smail;
	}

	public int getSage() {
		return sage;
	}

	public void setSage(int sage) {
		this.sage = sage;
	}

	public String getSgender() {
		return sgender;
	}

	public void setSgender(String sgender) {
		this.sgender = sgender;
	}

	public String getSlocation() {
		return slocation;
	}

	public void setSlocation(String slocation) {
		this.slocation = slocation;
	}

	public String getScourses() {
		return scourses;
	}

	public void setScourses(String scourses) {
		this.scourses = scourses;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

}
