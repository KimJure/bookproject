package kr.co.dong.mypage;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.co.dong.board.BoardDTO;
import kr.co.dong.book.bookDTO;
import kr.co.dong.help.HelpDTO;
import kr.co.dong.member.MemberDTO;
import kr.co.dong.reply.ReplyDTO;

@Service
public interface MypageService {
	
	//반납클릭
	public int returngo(MypageDTO MypageDTO);
	
	public int returnbook(bookDTO BookDTO);
	
	//연장
	public int extendDate(MypageDTO MypageDTO);
	
	//회원탈퇴
	public int myDelete(MemberDTO MemberDTO);

	//내정보수정
	public int myUpdate(MemberDTO MemberDTO);

	public MemberDTO memberDetail(String id);
	
	//
    public int getStartIndex(int page, int pageSize) throws Exception;

    public int getEndIndex(int page, int pageSize) throws Exception;
	
	//반납 페이징 처리
	public List<MypageDTO> getListByRange(int startIdx, int endIdx, String keyword, String sortBy, String id) throws Exception;
   
    public int getTotalCount(String id) throws Exception;
    
    //대여 페이징
    public List<MypageDTO> getListByRange1(int startIdx, int endIdx, String keyword, String sortBy, String id) throws Exception;
    
    public int getTotalCount1(String id) throws Exception;
  	
  	//내게시글 페이징 처리
  	public List<BoardDTO> getListByRange2(int startIdx, int endIdx, String keyword, String sortBy, String id) throws Exception;
     
    public int getTotalCount2(String id) throws Exception;
    
  //내댓글 페이징 처리
  	public List<ReplyDTO> getListByRange3(int startIdx, int endIdx, String keyword, String sortBy, String id) throws Exception;
     
    public int getTotalCount3(String id) throws Exception;
      
    //내문의내역
  	public HelpDTO helpDetail(int hno, String id);
  	
  	//내문의내역 페이징
  	public List<HelpDTO> getListByRange4(int startIdx, int endIdx, String keyword, String sortBy, String id) throws Exception;
  	
  	public int getTotalCount4(String id) throws Exception;

  	    


	
}
