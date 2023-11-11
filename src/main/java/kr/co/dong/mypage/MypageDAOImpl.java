package kr.co.dong.mypage;

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
import kr.co.dong.reply.ReplyDTO;

@Repository
public class MypageDAOImpl implements MypageDAO {
	
	@Autowired
	private SqlSession sqlsession;
	
	private static final String namespace = "kr.co.dong.mypage.mypageMapper";

	//회원탈퇴
	@Override
	public int myDelete(MemberDTO MemberDTO) {
		// TODO Auto-generated method stub
		return sqlsession.update(namespace+".myDelete", MemberDTO);
	}
	
	//
	@Override
	public int returngo(MypageDTO MypageDTO) {
		// TODO Auto-generated method stub
		return sqlsession.update(namespace+".returngo", MypageDTO);
	}

	@Override
	public int returnbook(bookDTO BookDTO) {
		// TODO Auto-generated method stub
		return sqlsession.update(namespace+".returnbook", BookDTO);
	}
	
	//
	@Override
	public int myUpdate(MemberDTO MemberDTO) {
		// TODO Auto-generated method stub
		return sqlsession.update(namespace+".myUpdate", MemberDTO);
	}

	@Override
	public MemberDTO memberDetail(String id) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+".memberDetail", id);
	}
	
	//
	
	   @Override
	   public int getTotalCount(String id) throws Exception{
	       return sqlsession.selectOne(namespace + ".getTotalCount", id);
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
	   
	   public List<MypageDTO> getListByRange(int startIdx, int endIdx, String keyword, String sortBy, String id) throws Exception {
	       Map<String, Object> parameterMap = new HashMap<>();
	       parameterMap.put("startIdx", startIdx);
	       parameterMap.put("endIdx", endIdx);
	       parameterMap.put("keyword", keyword);
	       parameterMap.put("sortBy", sortBy);
	       parameterMap.put("id", id);
	       return sqlsession.selectList(namespace + ".getListByRange", parameterMap);
	   }

		@Override
		public List<MypageDTO> getListByRange1(int startIdx, int endIdx, String keyword, String sortBy, String id) throws Exception {
			Map<String, Object> parameterMap = new HashMap<>();
		       parameterMap.put("startIdx", startIdx);
		       parameterMap.put("endIdx", endIdx);
		       parameterMap.put("keyword", keyword);
		       parameterMap.put("sortBy", sortBy);
		       parameterMap.put("id", id);
		       return sqlsession.selectList(namespace + ".getListByRange1", parameterMap);
		}
	
		@Override
		public int getTotalCount1(String id) throws Exception {
			// TODO Auto-generated method stub
			return sqlsession.selectOne(namespace + ".getTotalCount1", id);
		}
	   
		//
	   @Override
		public List<BoardDTO> getListByRange2(int startIdx, int endIdx, String keyword, String sortBy, String id) throws Exception {
			Map<String, Object> parameterMap = new HashMap<>();
		       parameterMap.put("startIdx", startIdx);
		       parameterMap.put("endIdx", endIdx);
		       parameterMap.put("keyword", keyword);
		       parameterMap.put("sortBy", sortBy);
		       parameterMap.put("id", id);
		       return sqlsession.selectList(namespace + ".getListByRange2", parameterMap);
		}

		@Override
		public int getTotalCount2(String id) throws Exception {
			// TODO Auto-generated method stub
			return sqlsession.selectOne(namespace + ".getTotalCount2", id);
		}

		@Override
		public int extendDate(MypageDTO MypageDTO) {
			// TODO Auto-generated method stub
			return sqlsession.update(namespace+".extendDate", MypageDTO);
		}
	
		 @Override
			public List<ReplyDTO> getListByRange3(int startIdx, int endIdx, String keyword, String sortBy, String id) throws Exception {
				Map<String, Object> parameterMap = new HashMap<>();
			       parameterMap.put("startIdx", startIdx);
			       parameterMap.put("endIdx", endIdx);
			       parameterMap.put("keyword", keyword);
			       parameterMap.put("sortBy", sortBy);
			       parameterMap.put("id", id);
			       return sqlsession.selectList(namespace + ".getListByRange3", parameterMap);
			}

			@Override
			public int getTotalCount3(String id) throws Exception {
				// TODO Auto-generated method stub
				return sqlsession.selectOne(namespace + ".getTotalCount3", id);
			}
			
			@Override
			public HelpDTO helpDetail(int hno, String id) {
				Map<String, Object> parameterMap = new HashMap<>();
			       parameterMap.put("hno", hno);
			       parameterMap.put("id", id);
				return sqlsession.selectOne(namespace+".helpDetail", parameterMap);
			}
			
			
			//
			public List<HelpDTO> getListByRange4(int startIdx, int endIdx, String keyword, String sortBy, String id) throws Exception {
			       Map<String, Object> parameterMap = new HashMap<>();
			       parameterMap.put("startIdx", startIdx);
			       parameterMap.put("endIdx", endIdx);
			       parameterMap.put("keyword", keyword);
			       parameterMap.put("sortBy", sortBy);
			       parameterMap.put("id", id);
			       return sqlsession.selectList(namespace + ".getListByRange4", parameterMap);
			   }
			
			@Override
		    public int getTotalCount4(String id) throws Exception{
		        return sqlsession.selectOne(namespace + ".getTotalCount4", id);
		    }

	
	

}
