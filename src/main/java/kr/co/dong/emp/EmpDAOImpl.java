/*
 * DAOImpl -> mybatis를 호출
 * 1)SqlSession 사용
 * 2)@Repository 
 */
package kr.co.dong.emp;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EmpDAOImpl implements EmpDAO{

	@Autowired	//인스턴스 호출
	private SqlSession sqlSession;
	
	private static final String namespace = "kr.co.dong.empMapper";
	
	@Override
	public int empCount() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".empCount");
	}

}
