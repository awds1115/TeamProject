package com.human.team;

public class Reserve {
	private String aname;
	private String bname;
	private int howmany;
	private int howmuch;
	public Reserve(String aname, String bname, int howmany, int howmuch) {
		this.aname = aname;
		this.bname = bname;
		this.howmany = howmany;
		this.howmuch = howmuch;
	}
	public Reserve() {
	}
	public String getAname() {
		return aname;
	}
	public String getBname() {
		return bname;
	}
	public int getHowmany() {
		return howmany;
	}
	public int getHowmuch() {
		return howmuch;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public void setHowmany(int howmany) {
		this.howmany = howmany;
	}
	public void setHowmuch(int howmuch) {
		this.howmuch = howmuch;
	}
	
}
