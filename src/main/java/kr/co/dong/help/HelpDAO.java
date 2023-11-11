package kr.co.dong.help;

import java.util.List;

import lombok.Data;

@Data
public interface HelpDAO {

	public int helpRegister(HelpDTO helpDTO) throws Exception;
	
	List<HelpDTO> getListByRange(int startIdx, int endIdx, String keyword, String sortBy) throws Exception;
	
	public int getStartIndex(int page, int pageSize) throws Exception;

	public int getEndIndex(int page, int pageSize) throws Exception;
	
	public int getTotalCount(String keyword) throws Exception;
	
	public HelpDTO helpAnswer(int hno);
	
}
