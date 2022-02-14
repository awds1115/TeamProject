package com.human.team;

public class RoomList {
	private int code;
	private String R_name;
	private String T_name;
	private int howmany;
	private int howmuch;
	public RoomList() {
	}
	public RoomList(int code, String r_name, String t_name, int howmany, int howmuch) {
		this.code = code;
		R_name = r_name;
		T_name = t_name;
		this.howmany = howmany;
		this.howmuch = howmuch;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getR_name() {
		return R_name;
	}
	public void setR_name(String r_name) {
		R_name = r_name;
	}
	public String getT_name() {
		return T_name;
	}
	public void setT_name(String t_name) {
		T_name = t_name;
	}
	public int getHowmany() {
		return howmany;
	}
	public void setHowmany(int howmany) {
		this.howmany = howmany;
	}
	public int getHowmuch() {
		return howmuch;
	}
	public void setHowmuch(int howmuch) {
		this.howmuch = howmuch;
	}
	
}
