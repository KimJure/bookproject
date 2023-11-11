package kr.co.dong.admin;

import java.util.List;

import kr.co.dong.board.BoardDTO;
import kr.co.dong.book.bookDTO;
import kr.co.dong.help.HelpDTO;
import kr.co.dong.member.MemberDTO;

public interface AdminService {
	
	public MemberDTO userDetail(String id) throws Exception;
	
	public int userUpdateview(MemberDTO memberDTO) throws Exception;
	
	public int answerContent(HelpDTO helpDTO) throws Exception;
	
	public int helpDelete(HelpDTO helpDTO) throws Exception;
	
	public int bookDelete(bookDTO BookDTO) throws Exception;
	
	public int userUpdate(MemberDTO memberDTO) throws Exception;
	
	public int userDelete(String id) throws Exception;
	
	public int userRelease(String id) throws Exception;
	
	public int userDrop(String id) throws Exception;
	
	public int getStartIndex(int page, int pageSize) throws Exception;

	public int getEndIndex(int page, int pageSize) throws Exception;
	
	//전체유저관리 리스트
	public int getTotalCount(String keyword) throws Exception;
	
	List<MemberDTO> getListByRange(int startIdx, int endIdx, String keyword, String sortBy, String division) throws Exception;
	
	//게시판관리 리스트
	public int getTotalCount1(String keyword) throws Exception;
	
	List<BoardDTO> getListByRange1(int startIdx, int endIdx, String keyword, String sortBy, String division) throws Exception;
	
	//도서관리 리스트
	public int getTotalCount2(String keyword) throws Exception;
	
	List<bookDTO> getListByRange2(int startIdx, int endIdx, String keyword, String sortBy, String division) throws Exception;
}
