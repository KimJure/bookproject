package kr.co.dong.book;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutionException;

import kr.co.dong.mypage.MypageDTO;
import lombok.Data;

@Data
public interface bookDAO {
	//인기도서
	public List<bookDTO> bestlist() throws Exception;
	//신간도서
	public List<bookDTO> newlist() throws Exception;
	//국내도서
	public List<bookDTO> origin1list(int displayPost,int postNum, String searchtype, String keyword) throws Exception;
	//국외도서
	public List<bookDTO> origin2list(int displayPost,int postNum, String searchtype, String keyword) throws Exception;
	//장르별리스트
	public List<bookDTO> genrelist(int displayPost,int postNum, String searchtype, String keyword) throws Exception;
	//장르별검색
	public List<bookDTO> genresearch(booksearch genresearch) throws Exception;
	//도서정보
	public bookDTO bookdetail(int booknum) throws Exception;
	//도서리스트
	public List<bookDTO> alllist() throws Exception;
	//책갯수
	public int bookcnt() throws Exception;
	//페이징
	public List<bookDTO> listpage(int displayPost,int postNum) throws Exception;
	//검색
	public List<bookDTO> search(int displayPost,int postNum, String searchtype, String keyword) throws Exception;
	//검색책갯수
	public int searchcnt(String searchtype,String keyword) throws Exception;
	//국내도서갯수
	public int origin1cnt(String searchtype,String keyword) throws Exception;
	//국외도서갯수
	public int origin2cnt(String searchtype,String keyword) throws Exception;
	//대여
	public int rental(bookDTO bookDTO) throws Exception;
	
	public int rentalinsert(MypageDTO mypageDTO) throws Exception;
	
	   public int getTotalCount(String keyword) throws Exception;
	   
	   List<bookDTO> getListByRange(int startIdx, int endIdx, String keyword, String sortBy) throws Exception;
	   
	   public int getStartIndex(int page, int pageSize) throws Exception;

	   public int getEndIndex(int page, int pageSize) throws Exception;
	   
	   public int bookInsert(bookDTO BookDTO);
	   
	   public bookDTO bookDetail(String booknum) throws Exception;
	   
	   public int bookUpdateview(bookDTO BookDTO) throws Exception;
	   
	   public int bookUpdate(bookDTO BookDTO) throws Exception;
	   
	   public int getBookCount(bookDTO BookDTO) throws Exception;
}
