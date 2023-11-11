package kr.co.dong.member;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO{
	
	@Autowired
	
	private SqlSession sqlsession;
	
	private static final String namespace = "kr.co.dong.MemberMapper";
	
	@Override
	
	public Map login(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+".login", map);
	}

	@Override
	public int joinMember(MemberDTO memberDTO) {
		// TODO Auto-generated method stub
		return sqlsession.insert(namespace+".joinMember", memberDTO);
	}

	@Override
	public int checkDuplicateId(String id) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+".checkDuplicateId", id);
	}
	
}
