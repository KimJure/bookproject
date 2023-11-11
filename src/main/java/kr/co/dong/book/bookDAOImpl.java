package kr.co.dong.book;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dong.mypage.MypageDTO;

@Repository
public class bookDAOImpl implements bookDAO {
	@Autowired
	private SqlSession sql;
	private static String namespace="kr.co.dong.book.bookMapper";
	
	@Override//인기도서
	public List<bookDTO> bestlist() throws Exception {
		return sql.selectList(namespace+".bestlist");
	}
	@Override//신간도서
	public List<bookDTO> newlist() throws Exception {
		return sql.selectList(namespace+".newlist");
	}
	@Override//국내도서
	public List<bookDTO> origin1list(int displayPost,int postNum, String searchtype, String keyword) throws Exception {
		
		HashMap<String,Object> data= new HashMap<String,Object>();
		
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		
		data.put("searchtype",searchtype);
		data.put("keyword",keyword);
		
		return sql.selectList(namespace+".origin1list",data);
	}
	@Override//국외도서
	public List<bookDTO> origin2list(int displayPost,int postNum, String searchtype, String keyword) throws Exception {
		
		HashMap<String,Object> data= new HashMap<String,Object>();
		
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		
		data.put("searchtype",searchtype);
		data.put("keyword",keyword);
		
		return sql.selectList(namespace+".origin2list",data);
	}
	@Override//장르별리스트
	public List<bookDTO> genrelist(int displayPost,int postNum, String searchtype, String keyword) throws Exception {
		
		HashMap<String,Object> data= new HashMap<String,Object>();
		
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		
		data.put("searchtype",searchtype);
		data.put("keyword",keyword);
		
		return sql.selectList(namespace+".genrelist",data);
	}
	@Override//도서정보
	public bookDTO bookdetail(int booknum) throws Exception {
		return sql.selectOne(namespace+".bookdetail",booknum);
	}
	@Override//장르별검색
	public List<bookDTO> genresearch(booksearch genresearch) throws Exception {
		return sql.selectList(namespace+".genresearch",genresearch);
	}
	@Override//도서리스트
	public List<bookDTO> alllist() throws Exception {
		return sql.selectList(namespace+".alllist");
	}
	@Override//책갯수
	public int bookcnt() throws Exception {
		return sql.selectOne(namespace+".bookcnt");
	}
	@Override//페이징
	public List<bookDTO> listpage(int displayPost, int postNum) throws Exception {

	 HashMap<String, Integer> data = new HashMap<String, Integer>();
	  
	 data.put("displayPost", displayPost);
	 data.put("postNum", postNum);
	  
	 return sql.selectList(namespace + ".listpage", data);
	}
	@Override//검색
	public List<bookDTO> search(int displayPost, int postNum, String searchtype, String keyword) throws Exception {
		
		HashMap<String,Object> data= new HashMap<String,Object>();
		
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		
		data.put("searchtype",searchtype);
		data.put("keyword",keyword);
		
		return sql.selectList(namespace+".search",data);
	}
	@Override//검색책갯수
	public int searchcnt(String searchtype, String keyword) throws Exception {
		
		HashMap<String,Object> data= new HashMap<String,Object>();
		
		data.put("searchtype",searchtype);
		data.put("keyword",keyword);
		
		return sql.selectOne(namespace+".searchcnt",data);
	}
	@Override//국내도서갯수
	public int origin1cnt(String searchtype,String keyword) throws Exception {
		
		
		HashMap<String,Object> data= new HashMap<String,Object>();
		
		data.put("searchtype",searchtype);
		data.put("keyword",keyword);
		
		return sql.selectOne(namespace+".origin1cnt",data);
	}
	@Override//국외도서갯수
	public int origin2cnt(String searchtype,String keyword) throws Exception {
		
		HashMap<String,Object> data= new HashMap<String,Object>();
		
		data.put("searchtype",searchtype);
		data.put("keyword",keyword);
		
		return sql.selectOne(namespace+".origin2cnt",data);
	}
	@Override
	public int rental(bookDTO bookDTO) throws Exception {
		return sql.update(namespace+".bookrental",bookDTO);
	}
	
	   @Override
	   public int getTotalCount(String keyword) throws Exception{
	       return sql.selectOne(namespace + ".getTotalCount", keyword);
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
	   
	   public List<bookDTO> getListByRange(int startIdx, int endIdx, String keyword, String sortBy) throws Exception {
	       Map<String, Object> parameterMap = new HashMap<>();
	       parameterMap.put("startIdx", startIdx);
	       parameterMap.put("endIdx", endIdx);
	       parameterMap.put("keyword", keyword);
	       parameterMap.put("sortBy", sortBy);
	       return sql.selectList(namespace + ".getListByRange", parameterMap);
	   }
	   @Override
	   public int bookInsert(bookDTO BookDTO) {
	      // TODO Auto-generated method stub
	      return sql.insert(namespace+".bookInsert", BookDTO);
	   }
	   
	   @Override
	   public bookDTO bookDetail(String booknum) throws Exception{
	      // TODO Auto-generated method stub
	      return sql.selectOne(namespace+".bookDetail", booknum);
	   }
	   
	   @Override
	   public int bookUpdateview(bookDTO BookDTO) throws Exception {
	      // TODO Auto-generated method stub
	      return sql.selectOne(namespace+".bookUpdateview", BookDTO);
	   }
	   
	   @Override
	   public int bookUpdate(bookDTO BookDTO) throws Exception {
	      // TODO Auto-generated method stub
	      return sql.update(namespace+".bookUpdate", BookDTO);
	   }
	   @Override
	   public int getBookCount(bookDTO BookDTO) throws Exception {
	      // TODO Auto-generated method stub
	      return sql.selectOne(namespace+".getBookCount", BookDTO);
	   }
	@Override
	public int rentalinsert(MypageDTO mypageDTO) throws Exception {
		return sql.insert(namespace+".bookrentalinsert",mypageDTO);
	}
}
