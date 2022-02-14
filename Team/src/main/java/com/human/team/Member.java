package com.human.team;

public class Member {
	String name;
	String gender;
	String userid;
	String passcode;
	String mobile;
	String type;
	public Member() {
	}
	public Member(String name, String gender, String userid, String passcode, String mobile, String type) {
		this.name = name;
		this.gender = gender;
		this.userid = userid;
		this.passcode = passcode;
		this.mobile = mobile;
		this.type = type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPasscode() {
		return passcode;
	}
	public void setPasscode(String passcode) {
		this.passcode = passcode;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
}
