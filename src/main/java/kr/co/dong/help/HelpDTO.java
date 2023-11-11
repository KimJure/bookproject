package kr.co.dong.help;

import lombok.Data;

@Data
public class HelpDTO {
	
	private int hno;
	private int state;
	private int del;
	private String id;
	private String title;
	private String content;
	private String recomment;
	private String hdate;
	private String rehdate;
	
	
	
	@Override
	public String toString() {
		return "HelpDTO [hno=" + hno + ", state=" + state + ", del=" + del + ", id=" + id + ", title=" + title
				+ ", content=" + content + ", recomment=" + recomment + ", hdate=" + hdate + ", rehdate=" + rehdate
				+ "]";
	}
	
	
	public int getHno() {
		return hno;
	}
	public void setHno(int hno) {
		this.hno = hno;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
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
	public String getRecomment() {
		return recomment;
	}
	public void setRecomment(String recomment) {
		this.recomment = recomment;
	}
	public String getHdate() {
		return hdate;
	}
	public void setHdate(String hdate) {
		this.hdate = hdate;
	}
	public String getRehdate() {
		return rehdate;
	}
	public void setRehdate(String rehdate) {
		this.rehdate = rehdate;
	}
	
}
