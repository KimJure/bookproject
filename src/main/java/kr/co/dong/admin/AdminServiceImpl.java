package kr.co.dong.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dong.board.BoardDTO;
import kr.co.dong.book.bookDTO;
import kr.co.dong.help.HelpDTO;
import kr.co.dong.member.MemberDTO;


@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	AdminDAO dao;


	@Override
	public MemberDTO userDetail(String id) throws Exception {
		// TODO Auto-generated method stub
		return dao.userDetail(id);
	}

	@Override
	public int userUpdateview(MemberDTO memberDTO) throws Exception{
		// TODO Auto-generated method stub
		return dao.userUpdateview(memberDTO);
	}

	@Override
	public int userUpdate(MemberDTO memberDTO) throws Exception{
		// TODO Auto-generated method stub
		return dao.userUpdate(memberDTO);
	}

	@Override
	public int userDelete(String id) throws Exception{
		// TODO Auto-generated method stub
		return dao.userDelete(id);
	}

	@Override
	public int userRelease(String id) throws Exception {
		// TODO Auto-generated method stub
		return dao.userRelease(id);
	}

	@Override
	public int userDrop(String id) throws Exception {
		// TODO Auto-generated method stub
		return dao.userDrop(id);
			
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
	
	//전체유저관리 리스트
	public List<MemberDTO> getListByRange(int startIdx, int endIdx, String keyword, String sortBy, String division) throws Exception {
        return dao.getListByRange(startIdx, endIdx, keyword, sortBy, division);
    }
    
    public int getTotalCount(String keyword) throws Exception {
        return dao.getTotalCount(keyword);
    }
    
    //게시판관리 리스트
    public int getTotalCount1(String keyword) throws Exception {
        return dao.getTotalCount1(keyword);
    }
    
    public List<BoardDTO> getListByRange1(int startIdx, int endIdx, String keyword, String sortBy, String division) throws Exception {
        return dao.getListByRange1(startIdx, endIdx, keyword, sortBy, division);
    }
    

	@Override
	public int answerContent(HelpDTO helpDTO) throws Exception {
		// TODO Auto-generated method stub
		return dao.answerContent(helpDTO);
	}

	@Override
	public int helpDelete(HelpDTO helpDTO) throws Exception {
		// TODO Auto-generated method stub
		return dao.helpDelete(helpDTO);
	}
	
	public int getTotalCount2(String keyword) throws Exception {
        return dao.getTotalCount2(keyword);
    }
	
	public List<bookDTO> getListByRange2(int startIdx, int endIdx, String keyword, String sortBy, String division) throws Exception {
        return dao.getListByRange2(startIdx, endIdx, keyword, sortBy, division);
    }

	@Override
	public int bookDelete(bookDTO BookDTO) throws Exception {
		// TODO Auto-generated method stub
		return dao.bookDelete(BookDTO);
	}


	
}
