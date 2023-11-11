package kr.co.dong.book;

public class page {

	private int count;
	private int num;
	private int postNum=10;
	private int pageNum;
	private int displayPost;
	private int pageNumCnt=10;
	private int endPageNum;
	private int startPageNum;
	
	private boolean prev;
	private boolean next;
	
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
		dataCalc();
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getPostNum() {
		return postNum;
	}
	public void setPostNum(int postNum) {
		this.postNum = postNum;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getDisplayPost() {
		return displayPost;
	}
	public void setDisplayPost(int displayPost) {
		this.displayPost = displayPost;
	}
	public int getPageNumCnt() {
		return pageNumCnt;
	}
	public void setPageNumCnt(int pageNumCnt) {
		this.pageNumCnt = pageNumCnt;
	}
	public int getEndPageNum() {
		return endPageNum;
	}
	public void setEndPageNum(int endPageNum) {
		this.endPageNum = endPageNum;
	}
	public int getStartPageNum() {
		return startPageNum;
	}
	public void setStartPageNum(int startPageNum) {
		this.startPageNum = startPageNum;
	}
	public boolean isPrev() {
		return prev;
	}
	public boolean getPrev() {
		 return prev;
	} 
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public boolean getNext() {
		 return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	
	private void dataCalc() {
		 
		 // 마지막 번호
		 endPageNum = (int)(Math.ceil((double)num / (double)pageNumCnt) * pageNumCnt);
		 
		 // 시작 번호
		 startPageNum = endPageNum - (pageNumCnt - 1);
		 
		 // 마지막 번호 재계산
		 int endPageNum_tmp = (int)(Math.ceil((double)count / (double)pageNumCnt));
		 
		 if(endPageNum > endPageNum_tmp) {
		  endPageNum = endPageNum_tmp;
		 }
		 
		 prev = startPageNum == 1 ? false : true;
		 next = endPageNum * pageNumCnt >= count ? false : true;
		 
		 displayPost = (num - 1) * postNum;
		 
		}
	
	public String getsearchtypekeyword() {
		 
		 if(searchtype.equals("") || keyword.equals("")) {
		  return ""; 
		 } else {
		  return "&searchtype=" + searchtype + "&keyword=" + keyword; 
		 }
		}

		private String searchtype;
		private String keyword; 

		public void setsearchtype(String searchtype) {
		 this.searchtype = searchtype;  
		}

		public String getsearchType() {
		 return searchtype;
		} 

		public void setkeyword(String keyword) {
		 this.keyword = keyword;  
		} 

		public String getkeyword() {
		 return keyword;
		}
	
}
