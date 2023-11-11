package kr.co.dong.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dong.board.BoardDTO;
import kr.co.dong.book.bookDTO;
import kr.co.dong.help.HelpDTO;
import kr.co.dong.member.MemberDTO;
@Repository
public class AdminDAOImpl implements AdminDAO{
	
	@Autowired
	private SqlSession sqlsession;
	
	private static final String namespace = "kr.co.dong.AdminMapper";

	@Override
	public MemberDTO userDetail(String id) throws Exception{
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+".userDetail", id);
	}

	@Override
	public int userUpdateview(MemberDTO memberDTO) throws Exception{
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+".userUpdateview", memberDTO);
	}

	@Override
	public int userUpdate(MemberDTO memberDTO) throws Exception{
		// TODO Auto-generated method stub
		return sqlsession.update(namespace+".userUpdate", memberDTO);
	}

	@Override
	public int userDelete(String id) throws Exception{
		// TODO Auto-generated method stub
		return sqlsession.update(namespace+".userDelete", id);
	}

	@Override
	public int userRelease(String id) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.update(namespace+".userRelease", id);
	}

	@Override
	public int userDrop(String id) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.update(namespace+".userDrop", id);
	}

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
	
	//유저관리 리스트
	@Override
	public int getTotalCount(String keyword) throws Exception{
	    return sqlsession.selectOne(namespace + ".getTotalCount", keyword);
	}
	
	public List<MemberDTO> getListByRange(int startIdx, int endIdx, String keyword, String sortBy, String division) throws Exception {
	    Map<String, Object> parameterMap = new HashMap<>();
	    parameterMap.put("startIdx", startIdx);
	    parameterMap.put("endIdx", endIdx);
	    parameterMap.put("keyword", keyword);
	    parameterMap.put("sortBy", sortBy);
	    parameterMap.put("sortBy", division);
	    return sqlsession.selectList(namespace + ".getListByRange", parameterMap);
	}

	
	//게시판관리 리스트
	@Override
	public int getTotalCount1(String keyword) throws Exception{
	    return sqlsession.selectOne(namespace + ".getTotalCount1", keyword);
	}
	
	public List<BoardDTO> getListByRange1(int startIdx, int endIdx, String keyword, String sortBy, String division) throws Exception {
	    Map<String, Object> parameterMap = new HashMap<>();
	    parameterMap.put("startIdx", startIdx);
	    parameterMap.put("endIdx", endIdx);
	    parameterMap.put("keyword", keyword);
	    parameterMap.put("sortBy", sortBy);
	    parameterMap.put("keyword", division);
	    return sqlsession.selectList(namespace + ".getListByRange1", parameterMap);
	}

	@Override
	public int answerContent(HelpDTO helpDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.update(namespace+".answerContent", helpDTO);
	}

	@Override
	public int helpDelete(HelpDTO helpDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.update(namespace+".helpDelete", helpDTO);
	}
	
	@Override
	public int getTotalCount2(String keyword) throws Exception{
	    return sqlsession.selectOne(namespace + ".getTotalCount2", keyword);
	}
	
	public List<bookDTO> getListByRange2(int startIdx, int endIdx, String keyword, String sortBy, String division) throws Exception {
	    Map<String, Object> parameterMap = new HashMap<>();
	    parameterMap.put("startIdx", startIdx);
	    parameterMap.put("endIdx", endIdx);
	    parameterMap.put("keyword", keyword);
	    parameterMap.put("sortBy", sortBy);
	    parameterMap.put("sortBy", division);
	    return sqlsession.selectList(namespace + ".getListByRange2", parameterMap);
	}

	@Override
	public int bookDelete(bookDTO BookDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.update(namespace+".bookDelete", BookDTO);
	}




}
