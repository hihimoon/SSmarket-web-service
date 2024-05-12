package backendweb.z01_vo;

public class Member {
	private int memno;
	private String nickname;
	private String profile;
	private String location1;
	private String location2;
	private int auth;
	private String grade;
	private String phonenumber;
	private String pwd;
	
	public Member() {

	}
	
	public Member(String phonenumber, String nickname, String location1, String location2, String pwd) {
		this.phonenumber = phonenumber;
		this.nickname = nickname;
		this.location1 = location1;
		this.location2 = location2;
		this.pwd = pwd;
	}
	

	public Member(String pwd, String nickname, String profile, String location1, String location2, String phonenumber) {
		this.pwd = pwd;
		this.nickname = nickname;
		this.profile = profile;
		this.location1 = location1;
		this.location2 = location2;
		this.phonenumber = phonenumber;
	}

	public Member(int memno, String phonenumber, String nickname, String profile, String location1, String location2,
			int auth, String grade) {
		this.memno = memno;
		this.phonenumber = phonenumber;
		this.nickname = nickname;
		this.profile = profile;
		this.location1 = location1;
		this.location2 = location2;
		this.auth = auth;
		this.grade = grade;
	}
	
	public Member(int memno, String pwd, String nickname, String profile, String location1,
			String location2, int auth, String grade, String phonenumber) {
		this.memno = memno;
		this.pwd = pwd;
		this.nickname = nickname;
		this.profile = profile;
		this.location1 = location1;
		this.location2 = location2;
		this.auth = auth;
		this.grade = grade;
		this.phonenumber = phonenumber;
	}

	public Member(int memno, String nickname) {
		this.memno = memno;
		this.nickname = nickname;
	}
	
	public int getMemno() {
		return memno;
	}
	public void setMemno(int memno) {
		this.memno = memno;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getLocation1() {
		return location1;
	}
	public void setLocation1(String location1) {
		this.location1 = location1;
	}
	public String getLocation2() {
		return location2;
	}
	public void setLocation2(String location2) {
		this.location2 = location2;
	}
	public int getAuth() {
		return auth;
	}
	public void setAuth(int auth) {
		this.auth = auth;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

}
