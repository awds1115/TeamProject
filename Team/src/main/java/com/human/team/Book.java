package com.human.team;

public class Book {
	private int book_id;
	private int roomcode;
	private String start_dt;
	private String end_dt;
	private int howmany;
	private String guest;
	private String mobile;
	private int howmuch;
	private String member_id;
	public Book(int book_id, int roomcode, String start_dt, String end_dt, int howmany, String guest, String mobile,
			int howmuch, String member_id) {
		this.book_id = book_id;
		this.roomcode = roomcode;
		this.start_dt = start_dt;
		this.end_dt = end_dt;
		this.howmany = howmany;
		this.guest = guest;
		this.mobile = mobile;
		this.howmuch = howmuch;
		this.member_id = member_id;
	}
	public Book() {
	}
	public int getBook_id() {
		return book_id;
	}
	public int getRoomcode() {
		return roomcode;
	}
	public String getStart_dt() {
		return start_dt;
	}
	public String getEnd_dt() {
		return end_dt;
	}
	public int getHowmany() {
		return howmany;
	}
	public String getGuest() {
		return guest;
	}
	public String getMobile() {
		return mobile;
	}
	public int getHowmuch() {
		return howmuch;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}
	public void setRoomcode(int roomcode) {
		this.roomcode = roomcode;
	}
	public void setStart_dt(String start_dt) {
		this.start_dt = start_dt;
	}
	public void setEnd_dt(String end_dt) {
		this.end_dt = end_dt;
	}
	public void setHowmany(int howmany) {
		this.howmany = howmany;
	}
	public void setGuest(String guest) {
		this.guest = guest;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public void setHowmuch(int howmuch) {
		this.howmuch = howmuch;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	
}
