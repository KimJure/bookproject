package kr.co.dong.reply;

public class ReplyDTO {
	
	private int dno;
	private int bno;
	private int del;
	private String dcontent;
	private String id;
	private String ddate;
	private int replynum;
	
	public int getReplynum() {
		return replynum;
	}

	public void setReplynum(int replynum) {
		this.replynum = replynum;
	}

	@Override
	public String toString() {
		return "ReplyDTO [dno=" + dno + ", bno=" + bno + ", del=" + del + ", dcontent=" + dcontent + ", id=" + id
				+ ", ddate=" + ddate + ", replynum=" + replynum + "]";
	}
	
	public int getDno() {
		return dno;
	}
	public void setDno(int dno) {
		this.dno = dno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	public String getDcontent() {
		return dcontent;
	}
	public void setDcontent(String dcontent) {
		this.dcontent = dcontent;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDdate() {
		return ddate;
	}
	public void setDdate(String ddate) {
		this.ddate = ddate;
	}
	
}
