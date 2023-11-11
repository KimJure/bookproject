package kr.co.dong.book;

import lombok.Data;

@Data
public class bookDTO {
	
	private int booknum;
	private int pay;
	private int bookrentalcnt;
	private int bookcnt;
	private int bookpage;
	private int bookorigin;
	private int bookmax;
	private String bookname;
	private String publishr;
	private String genre;
	private String bookcomment;
	private String country;
	private String author;
	private String regdate;
	
	
	@Override
	public String toString() {
		return "bookDTO [booknum=" + booknum + ", pay=" + pay + ", bookrentalcnt=" + bookrentalcnt + ", bookcnt="
				+ bookcnt + ", bookpage=" + bookpage + ", bookorigin=" + bookorigin + ", bookmax=" + bookmax
				+ ", bookname=" + bookname + ", publishr=" + publishr + ", genre=" + genre + ", bookcomment="
				+ bookcomment + ", country=" + country + ", author=" + author + ", regdate=" + regdate + "]";
	}
	
	public int getBooknum() {
		return booknum;
	}
	public void setBooknum(int booknum) {
		this.booknum = booknum;
	}
	public int getBookmax() {
		return bookmax;
	}

	public void setBookmax(int bookmax) {
		this.bookmax = bookmax;
	}
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	public int getBookrentalcnt() {
		return bookrentalcnt;
	}
	public void setBookrentalcnt(int bookrentalcnt) {
		this.bookrentalcnt = bookrentalcnt;
	}
	public int getBookcnt() {
		return bookcnt;
	}
	public void setBookcnt(int bookcnt) {
		this.bookcnt = bookcnt;
	}
	public int getBookpage() {
		return bookpage;
	}
	public void setBookpage(int bookpage) {
		this.bookpage = bookpage;
	}
	public int getBookorigin() {
		return bookorigin;
	}
	public void setBookorigin(int bookorigin) {
		this.bookorigin = bookorigin;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public String getPublishr() {
		return publishr;
	}
	public void setPublishr(String publishr) {
		this.publishr = publishr;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getBookcomment() {
		return bookcomment;
	}
	public void setBookcomment(String bookcomment) {
		this.bookcomment = bookcomment;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	
}
