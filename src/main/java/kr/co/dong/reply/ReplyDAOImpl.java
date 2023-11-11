package kr.co.dong.reply;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAOImpl implements ReplyDAO{
	
	@Autowired
	private SqlSession sqlsession;
	
	private static final String namespace = "kr.co.dong.ReplyMapper";
	
	@Override
	public int ReplyInsert(ReplyDTO replyDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.insert(namespace+".ReplyInsert", replyDTO);
	}

	@Override
	public List<ReplyDTO> ReplyList(int bno) throws Exception {
		// TODO Auto-generated method stub
		 return sqlsession.selectList(namespace + ".ReplyList", bno);
	}

	@Override
	public int ReplyUpdate(ReplyDTO replyDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.update(namespace+".ReplyUpdate", replyDTO);
	}

	@Override
	public int ReplyDelete(int dno) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.delete(namespace+".ReplyDelete", dno);
	}

}
