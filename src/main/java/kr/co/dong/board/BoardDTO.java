package kr.co.dong.board;

import lombok.Data;

@Data
public class BoardDTO {
	
	private int bno;
	private int type;
	private int likecnt;
	private int viewcnt;
	private int del;
	private String id;
	private String title;
	private String content;
	private String regdate;
	private boolean isLiked;
	
	
	
	

	@Override
	public String toString() {
		return "BoardDTO [bno=" + bno + ", type=" + type + ", likecnt=" + likecnt + ", viewcnt=" + viewcnt + ", del="
				+ del + ", id=" + id + ", title=" + title + ", content=" + content + ", regdate=" + regdate
				+ ", isLiked=" + isLiked + "]";
	}
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	
	public boolean isLiked() {
		return isLiked;
	}

	public void setLiked(boolean isLiked) {
		this.isLiked = isLiked;
	}

	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getLikecnt() {
		return likecnt;
	}
	public void setLikecnt(int likecnt) {
		this.likecnt = likecnt;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
}
