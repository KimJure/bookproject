package kr.co.dong.reply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Autowired
	ReplyDAO dao;
	
	@Override
	public int ReplyInsert(ReplyDTO replyDTO) throws Exception {
		// TODO Auto-generated method stub
		return dao.ReplyInsert(replyDTO);
	}

	@Override
	public List<ReplyDTO> ReplyList(int bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.ReplyList(bno);
	}

	@Override
	public int ReplyUpdate(ReplyDTO replyDTO) throws Exception {
		// TODO Auto-generated method stub
		return dao.ReplyUpdate(replyDTO);
	}

	@Override
	public int ReplyDelete(int dno) throws Exception {
		// TODO Auto-generated method stub
		return dao.ReplyDelete(dno);
	}

}
