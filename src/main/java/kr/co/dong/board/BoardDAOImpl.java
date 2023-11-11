package kr.co.dong.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dong.book.bookDTO;
import kr.co.dong.member.MemberDTO;


@Repository
public class BoardDAOImpl implements BoardDAO{
	
	@Autowired
	private SqlSession sqlsession;
	
	private static final String namespace = "kr.co.dong.BoardMapper";

	@Override
	public int getStartIndex(int page, int pageSize) throws Exception{
		// TODO Auto-generated method stub
		return (page - 1) * pageSize;
	}


	@Override
	public int getEndIndex(int page, int pageSize) throws Exception{
		// TODO Auto-generated method stub
		return page * pageSize;
	}
	
	
	@Override
	public int boardInsert(BoardDTO boardDTO) throws Exception{
		// TODO Auto-generated method stub
		return sqlsession.insert(namespace+".boardInsert", boardDTO);
	}


	@Override
	public BoardDTO boardDetail(int bno) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+".boardDetail", bno);
	}

	  @Override
	   public int updateLikeCount(int bno, boolean isLiked) {
		        return sqlsession.update("updateLikeCount", bno);
		}

	@Override
	public int downLikeCount(int bno, boolean isLiked) {
		        return sqlsession.update("downLikeCount", bno);
		}
	
	@Override
	public int boardDelete(int bno) throws Exception{
		// TODO Auto-generated method stub
		return sqlsession.update(namespace+".boardDelete", bno);
	}
	
	@Override
	public int boardUpdateview(BoardDTO boardDTO) throws Exception{
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+".boardUpdateview", boardDTO);
	}
	
	@Override
	public int boardUpdate(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.update(namespace+".boardUpdate", boardDTO);
	}
	
	@Override
	public int viewcntUp(int bno) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.update(namespace+".viewcntUp", bno);
	}
	
	
	//------------------------------------------------------------------------------------------
	
	// 전체게시글 보기
	public List<BoardDTO> getListByRange(int startIdx, int endIdx, String keyword, String sortBy) throws Exception {
	    Map<String, Object> parameterMap = new HashMap<>();
	    parameterMap.put("startIdx", startIdx);
	    parameterMap.put("endIdx", endIdx);
	    parameterMap.put("keyword", keyword);
	    parameterMap.put("sortBy", sortBy);
	    return sqlsession.selectList(namespace + ".getListByRange", parameterMap);
	}
	@Override
	public int getTotalCount(String keyword) throws Exception{
	    return sqlsession.selectOne(namespace + ".getTotalCount", keyword);
	}
	
	// 공지사항 보기
	@Override
	public List<BoardDTO> getListByRange1(int startIdx, int endIdx, String keyword, String sortBy) throws Exception {
		// TODO Auto-generated method stub
	    Map<String, Object> parameterMap = new HashMap<>();
	    parameterMap.put("startIdx", startIdx);
	    parameterMap.put("endIdx", endIdx);
	    parameterMap.put("keyword", keyword);
	    parameterMap.put("sortBy", sortBy);
	    return sqlsession.selectList(namespace + ".getListByRange1", parameterMap);
	}
	
	@Override
	public int getTotalCount1(String keyword) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace + ".getTotalCount1", keyword);
	}
	

	// 자유게시판 보기
	@Override
	public int getTotalCount2(String keyword) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace + ".getTotalCount2", keyword);
	}


	@Override
	public List<BoardDTO> getListByRange2(int startIdx, int endIdx, String keyword, String sortBy) throws Exception {
		// TODO Auto-generated method stub
	    Map<String, Object> parameterMap = new HashMap<>();
	    parameterMap.put("startIdx", startIdx);
	    parameterMap.put("endIdx", endIdx);
	    parameterMap.put("keyword", keyword);
	    parameterMap.put("sortBy", sortBy);
	    return sqlsession.selectList(namespace + ".getListByRange2", parameterMap);
	}
	

	// 리뷰 게시판보기
	@Override
	public int getTotalCount3(String keyword) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace + ".getTotalCount3", keyword);
	}


	@Override
	public List<BoardDTO> getListByRange3(int startIdx, int endIdx, String keyword, String sortBy) throws Exception {
		// TODO Auto-generated method stub
	    Map<String, Object> parameterMap = new HashMap<>();
	    parameterMap.put("startIdx", startIdx);
	    parameterMap.put("endIdx", endIdx);
	    parameterMap.put("keyword", keyword);
	    parameterMap.put("sortBy", sortBy);
	    return sqlsession.selectList(namespace + ".getListByRange3", parameterMap);
	}
	
	
}
