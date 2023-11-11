package kr.co.dong.mypage;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import lombok.Data;

@Data
public class MypageDTO {
	
	public int rentalnum;
	public int booknum;
	public int overdue;
	public int rentalcnt;
	public int rentalex;
	public int extend;
	public String id;
	public String bookname;
	public String rentalday;
	public String returnday;
	public String returndate;
	public String status;
	
	
	public int getRentalnum() {
		return rentalnum;
	}
	public void setRentalnum(int rentalnum) {
		this.rentalnum = rentalnum;
	}
	public int getBooknum() {
		return booknum;
	}
	public void setBooknum(int booknum) {
		this.booknum = booknum;
	}
	public int getOverdue() {
		return overdue;
	}
	public void setOverdue(int overdue) {
		this.overdue = overdue;
	}
	public int getRentalcnt() {
		return rentalcnt;
	}
	public void setRentalcnt(int rentalcnt) {
		this.rentalcnt = rentalcnt;
	}
	public int getRentalex() {
		return rentalex;
	}
	public void setRentalex(int rentalex) {
		this.rentalex = rentalex;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public String getRentalday() {
		return rentalday;
	}
	public void setRentalday(String rentalday) {
		this.rentalday = rentalday;
	}
	public String getReturnday() {
		return returnday;
	}
	public void setReturnday(String returnday) {
		this.returnday = returnday;
	}
	public String getReturndate() {
		return returndate;
	}
	public void setReturndate(String returndate) {
		this.returndate = returndate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	public void checkOverdue() {
        LocalDateTime currentDateTime = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        LocalDateTime returnDateTime = LocalDateTime.parse(returndate, formatter);

        if (returnDateTime.isBefore(currentDateTime)) {
            overdue++;
        }
    }
	public int getExtend() {
		return extend;
	}
	public void setExtend(int extend) {
		this.extend = extend;
	}
	
	
	

}
