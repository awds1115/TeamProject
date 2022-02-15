package com.human.team;

public class Notice {
	private int id;
	private String name;
	private String title;
	private String content;
	private String created;
	private int viewCnt;
	private int bno;
	public Notice() {
	}
	public Notice(int id, String name, String title, String content, String created, int viewCnt, int bno) {
		this.id = id;
		this.name = name;
		this.title = title;
		this.content = content;
		this.created = created;
		this.viewCnt = viewCnt;
		this.bno = bno;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	
}
