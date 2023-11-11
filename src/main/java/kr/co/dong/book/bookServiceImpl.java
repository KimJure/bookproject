package kr.co.dong.book;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dong.mypage.MypageDTO;

@Service
public class bookServiceImpl implements bookService {
	@Autowired
	bookDAO dao;

	@Override//인기도서
	public List<bookDTO> bestlist() throws Exception {
		return dao.bestlist();
	}

	@Override//신간도서
	public List<bookDTO> newlist() throws Exception {
		return dao.newlist();
	}

	@Override//국내도서
	public List<bookDTO> origin1list(int displayPost,int postNum, String searchtype, String keyword) throws Exception {
		return dao.origin1list(displayPost,postNum, searchtype, keyword);
	}
	
	@Override//국외도서
	public List<bookDTO> origin2list(int displayPost,int postNum, String searchtype, String keyword) throws Exception {
		return dao.origin2list(displayPost,postNum, searchtype, keyword);
	}
	
	@Override//장르별
	public List<bookDTO> genrelist(int displayPost,int postNum, String searchtype, String keyword) throws Exception {
		return dao.genrelist(displayPost,postNum, searchtype, keyword);
	}

	@Override//도서정보
	public bookDTO bookdetail(int booknum) throws Exception {
		return dao.bookdetail(booknum);
	}

	@Override//장르검색
	public List<bookDTO> genresearch(booksearch genresearch) throws Exception {
		return dao.genresearch(genresearch);
	}

	@Override//도서리스트
	public List<bookDTO> alllist() throws Exception {
		return dao.alllist();
	}

	@Override//책갯수
	public int bookcnt() throws Exception {
		return dao.bookcnt();
	}

	@Override//페이징
	public List<bookDTO> listpage(int displayPost, int postNum) throws Exception {
		return dao.listpage(displayPost, postNum);
	}

	@Override//검색
	public List<bookDTO> search(int displayPost, int postNum, String searchtype, String keyword) throws Exception {
		return dao.search(displayPost, postNum, searchtype, keyword);
	}

	@Override//검색책갯수
	public int searchcnt(String searchtype, String keyword) throws Exception {
		return dao.searchcnt(searchtype, keyword);
	}

	@Override//국내도서갯수
	public int origin1cnt(String searchtype, String keyword) throws Exception {
		return dao.origin1cnt(searchtype, keyword);
	}

	@Override//국외도서갯수
	public int origin2cnt(String searchtype, String keyword) throws Exception {
		return dao.origin2cnt(searchtype, keyword);
	}

	@Override//대여
	public int rental(bookDTO bookDTO) throws Exception {
		return dao.rental(bookDTO);
	}

	   public List<bookDTO> getListByRange(int startIdx, int endIdx, String keyword, String sortBy) throws Exception {
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

	   @Override
	   public int bookInsert(bookDTO BookDTO) {
	      // TODO Auto-generated method stub
	      return dao.bookInsert(BookDTO);
	   }
	   
	   @Override
	   public bookDTO bookDetail(String booknum) throws Exception {
	      // TODO Auto-generated method stub
	      return dao.bookDetail(booknum);
	   }
	   
	   @Override
	   public int bookUpdateview(bookDTO BookDTO) throws Exception {
	      // TODO Auto-generated method stub
	      return dao.bookUpdateview(BookDTO);
	   }
	   
	   @Override
	   public int bookUpdate(bookDTO BookDTO) throws Exception {
	      // TODO Auto-generated method stub
	      return dao.bookUpdate(BookDTO);
	   }

	   @Override
	   public int getBookCount(bookDTO BookDTO) throws Exception {
	      // TODO Auto-generated method stub
	      return dao.getBookCount(BookDTO);
	   }

	@Override
	public int rentalinsert(MypageDTO mypageDTO) throws Exception {
		// TODO Auto-generated method stub
		return dao.rentalinsert(mypageDTO);
	}
	   
	
	
}
