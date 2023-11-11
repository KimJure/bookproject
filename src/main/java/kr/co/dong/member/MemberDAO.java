package kr.co.dong.member;

import java.util.Map;

import kr.co.dong.book.bookDTO;

public interface MemberDAO {
	public Map login(Map<String, Object> map)throws Exception;
	
	public int joinMember(MemberDTO MemberDTO);
	
	public int checkDuplicateId(String id);
}



