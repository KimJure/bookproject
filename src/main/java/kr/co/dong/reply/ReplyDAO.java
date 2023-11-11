package kr.co.dong.reply;

import java.util.List;


import lombok.Data;

@Data
public interface ReplyDAO {
	
	public int ReplyInsert(ReplyDTO replyDTO) throws Exception;;
	
	List<ReplyDTO> ReplyList(int bno) throws Exception;
	
	public int ReplyUpdate(ReplyDTO replyDTO) throws Exception;
	
	public int ReplyDelete(int dno) throws Exception;

}
