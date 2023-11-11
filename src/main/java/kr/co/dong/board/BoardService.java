package kr.co.dong.board;

import java.util.List;

import kr.co.dong.book.bookDTO;



public interface BoardService {

	// 전체게시글 보기
	public int getTotalCount(String keyword) throws Exception;
	
	List<BoardDTO> getListByRange(int startIdx, int endIdx, String keyword, String sortBy) throws Exception;

	// 공지사항 보기
	public int getTotalCount1(String keyword) throws Exception;
	
	List<BoardDTO> getListByRange1(int startIdx, int endIdx, String keyword, String sortBy) throws Exception;
	
	// 자유게시판 보기
	public int getTotalCount2(String keyword) throws Exception;
	
	List<BoardDTO> getListByRange2(int startIdx, int endIdx, String keyword, String sortBy) throws Exception;
	
	// 리뷰게시판 보기
	public int getTotalCount3(String keyword) throws Exception;
	
	List<BoardDTO> getListByRange3(int startIdx, int endIdx, String keyword, String sortBy) throws Exception;
	
	//----------------------------------------------------------------------------------------------------------
	
	public int getStartIndex(int page, int pageSize) throws Exception;

	public int getEndIndex(int page, int pageSize) throws Exception;
	
	public int boardInsert(BoardDTO boardDTO) throws Exception;
	
	public BoardDTO boardDetail(int bno) throws Exception;
	
	public int boardDelete(int bno) throws Exception;
	
	public int downLikeCount(int bno, boolean isLiked);
	
	public int updateLikeCount(int bno, boolean isLiked);
	
	public int boardUpdateview(BoardDTO boardDTO) throws Exception;
	
	public int boardUpdate(BoardDTO boardDTO) throws Exception;
	
	public int viewcntUp(int bno) throws Exception;

}
