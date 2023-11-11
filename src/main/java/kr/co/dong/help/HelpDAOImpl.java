package kr.co.dong.help;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HelpDAOImpl implements HelpDAO{
	
	@Autowired
	private SqlSession sqlsession;
	
	private static String namespace="kr.co.dong.HelpMapper";

	@Override
	public int helpRegister(HelpDTO helpDTO) throws Exception{
		// TODO Auto-generated method stub
		return sqlsession.insert(namespace+".helpRegister", helpDTO);
	}
	
	@Override
	public HelpDTO helpAnswer(int hno) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+".helpAnswer", hno);
	}
	
	@Override
	public int getTotalCount(String keyword) throws Exception{
	    return sqlsession.selectOne(namespace + ".getTotalCount", keyword);
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
	
	public List<HelpDTO> getListByRange(int startIdx, int endIdx, String keyword, String sortBy) throws Exception {
	    Map<String, Object> parameterMap = new HashMap<>();
	    parameterMap.put("startIdx", startIdx);
	    parameterMap.put("endIdx", endIdx);
	    parameterMap.put("keyword", keyword);
	    parameterMap.put("sortBy", sortBy);
	    return sqlsession.selectList(namespace + ".getListByRange", parameterMap);
	}
	
}
