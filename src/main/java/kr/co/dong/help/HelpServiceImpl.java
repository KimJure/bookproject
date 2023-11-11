package kr.co.dong.help;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class HelpServiceImpl implements HelpService {

		@Autowired
		HelpDAO dao;
		


	@Override
	public int helpRegister(HelpDTO helpDTO) throws Exception{
		// TODO Auto-generated method stub
		return dao.helpRegister(helpDTO);
		
		
	}
	
	@Override
	public HelpDTO helpAnswer(int hno) {
		// TODO Auto-generated method stub
		return dao.helpAnswer(hno);
	}
	
	public List<HelpDTO> getListByRange(int startIdx, int endIdx, String keyword, String sortBy) throws Exception {
        return dao.getListByRange(startIdx, endIdx, keyword, sortBy);
    }
    
    public int getTotalCount(String keyword) throws Exception {
        return dao.getTotalCount(keyword);
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

	

}
