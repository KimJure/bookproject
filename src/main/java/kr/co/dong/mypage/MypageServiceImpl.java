package kr.co.dong.mypage;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dong.board.BoardDTO;
import kr.co.dong.book.bookDTO;
import kr.co.dong.help.HelpDTO;
import kr.co.dong.member.MemberDTO;
import kr.co.dong.reply.ReplyDTO;

@Service
public class MypageServiceImpl implements MypageService {

	@Autowired
	MypageDAO dao;

	//회원탈퇴
	@Override
	public int myDelete(MemberDTO MemberDTO) {
		// TODO Auto-generated method stub
		return dao.myDelete(MemberDTO);
	}

	@Override
	public int returngo(MypageDTO MypageDTO) {
		// TODO Auto-generated method stub
		return dao.returngo(MypageDTO);
	}
	
	

	@Override
	public int returnbook(bookDTO BookDTO) {
		// TODO Auto-generated method stub
		return dao.returnbook(BookDTO);
	}

	@Override
	public int myUpdate(MemberDTO MemberDTO) {
		// TODO Auto-generated method stub
		return dao.myUpdate(MemberDTO);
	}

	@Override
	public MemberDTO memberDetail(String id) {
		// TODO Auto-generated method stub
		return dao.memberDetail(id);
	}
	
	//
	
	   public List<MypageDTO> getListByRange(int startIdx, int endIdx, String keyword, String sortBy, String id) throws Exception {
	        return dao.getListByRange(startIdx, endIdx, keyword, sortBy, id);
	    }
	    
	    public int getTotalCount(String id) throws Exception {
	        return dao.getTotalCount(id);
	    }

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
		public List<MypageDTO> getListByRange1(int startIdx, int endIdx, String keyword, String sortBy, String id) throws Exception {
			// TODO Auto-generated method stub
			return dao.getListByRange1(startIdx, endIdx, keyword, sortBy, id);
		}
	
		@Override
		public int getTotalCount1(String id) throws Exception {
			// TODO Auto-generated method stub
			return dao.getTotalCount1(id);
		}
	   
		//
		@Override
		public List<BoardDTO> getListByRange2(int startIdx, int endIdx, String keyword, String sortBy, String id) throws Exception {
			// TODO Auto-generated method stub
			return dao.getListByRange2(startIdx, endIdx, keyword, sortBy, id);
		}

		@Override
		public int getTotalCount2(String id) throws Exception {
			// TODO Auto-generated method stub
			return dao.getTotalCount2(id);
		}

		@Override
		public int extendDate(MypageDTO MypageDTO) {
			// TODO Auto-generated method stub
			return dao.extendDate(MypageDTO);
		}
		
		@Override
		public List<ReplyDTO> getListByRange3(int startIdx, int endIdx, String keyword, String sortBy, String id) throws Exception {
			// TODO Auto-generated method stub
			return dao.getListByRange3(startIdx, endIdx, keyword, sortBy, id);
		}

		@Override
		public int getTotalCount3(String id) throws Exception {
			// TODO Auto-generated method stub
			return dao.getTotalCount3(id);
		}
		
		
	 	//
		@Override
		public HelpDTO helpDetail(int hno, String id) {
			// TODO Auto-generated method stub
			return dao.helpDetail(hno, id);
		}
			
			
		//
		
		public List<HelpDTO> getListByRange4(int startIdx, int endIdx, String keyword, String sortBy, String id) throws Exception {
	        return dao.getListByRange4(startIdx, endIdx, keyword, sortBy, id);
	    }
	    
	    public int getTotalCount4(String id) throws Exception {
	        return dao.getTotalCount4(id);
	    }
	

	
	
	
	
	

}
