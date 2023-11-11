package kr.co.dong.member;

import java.util.Map;

public interface MemberService {
	
	public Map login(Map<String, Object> map)throws Exception;
	
	public int joinMember(MemberDTO MemberDTO);
	
	public boolean checkDuplicateId(String id);
	
}
