package kr.co.dong.book;

import lombok.Data;

@Data
public class booksearch {
	

	private String keyword;
	private String searchtype;


	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getSearchtype() {
		return searchtype;
	}
	public void setSearchtype(String searchtype) {
		this.searchtype = searchtype;
	}
	
}