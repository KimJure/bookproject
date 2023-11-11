package kr.co.dong.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dong.book.bookDTO;
import kr.co.dong.member.MemberDTO;



@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	BoardDAO dao;


	@Override
	public int getStartIndex(int page, int pageSize) throws Exception {
		// TODO Auto-generated method stub
		return dao.getStartIndex(page,pageSize);
	}

	@Override
	public int getEndIndex(int page, int pageSize) throws Exception {
		// TODO Auto-generated method stub
		return dao.getEndIndex(page,pageSize);

	}
	
	@Override
	public int boardInsert(BoardDTO boardDTO) throws Exception{
		// TODO Auto-generated method stub
		return dao.boardInsert(boardDTO);
	}

	@Override
	public BoardDTO boardDetail(int bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.boardDetail(bno);
	}
	
	@Override
	 public int updateLikeCount(int bno, boolean isLiked) {
		 return dao.updateLikeCount(bno, isLiked);	        
	    }

	@Override
	public int downLikeCount(int bno, boolean isLiked) {
		// TODO Auto-generated method stub
		return dao.downLikeCount(bno, isLiked);
	}
	
    
    @Override
	public int boardDelete(int bno) throws Exception{
		// TODO Auto-generated method stub
		return dao.boardDelete(bno);
	}
    
    @Override
	public int boardUpdateview(BoardDTO boardDTO) throws Exception{
		// TODO Auto-generated method stub
		return dao.boardUpdateview(boardDTO);
	}
    
    @Override
	public int boardUpdate(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return dao.boardUpdate(boardDTO);
	}

    @Override
   	public int viewcntUp(int bno) throws Exception {
   		// TODO Auto-generated method stub
   		return dao.viewcntUp(bno);
   	}
 //-------------------------------------------------------------------------------------------------------------
    //전시글 보기
	public List<BoardDTO> getListByRange(int startIdx, int endIdx, String keyword, String sortBy) throws Exception {
        return dao.getListByRange(startIdx, endIdx, keyword, sortBy);
    }
    
    public int getTotalCount(String keyword) throws Exception {
        return dao.getTotalCount(keyword);
    }
    
    // 공지사항 보기
	public List<BoardDTO> getListByRange1(int startIdx, int endIdx, String keyword, String sortBy) throws Exception {
        return dao.getListByRange1(startIdx, endIdx, keyword, sortBy);
    }
    
    public int getTotalCount1(String keyword) throws Exception {
        return dao.getTotalCount1(keyword);
    }
    
    // 자유게시판 보기
	public List<BoardDTO> getListByRange2(int startIdx, int endIdx, String keyword, String sortBy) throws Exception {
        return dao.getListByRange2(startIdx, endIdx, keyword, sortBy);
    }
    
    public int getTotalCount2(String keyword) throws Exception {
        return dao.getTotalCount2(keyword);
    }
    
    // 리뷰게시판 보기
	@Override
	public int getTotalCount3(String keyword) throws Exception {
		// TODO Auto-generated method stub
		return dao.getTotalCount3(keyword);
	}

	@Override
	public List<BoardDTO> getListByRange3(int startIdx, int endIdx, String keyword, String sortBy) throws Exception {
		// TODO Auto-generated method stub
		return dao.getListByRange3(startIdx, endIdx, keyword, sortBy);
	}
	

}
