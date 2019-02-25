package aaa.bbb.ccc.util;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImple implements BoardService {

	@Inject
	private SqlSession mDAO ;
	
	private static final String ns ="banana.apple.mapper.boardMapper";

	@Override
	public int infoInsert(Map<String, Object> map) {
		return mDAO.insert(ns+".infoInsert",map);
	}
	
	@Override
	public List<Map<Integer,Object>> infoList(Map<String,Object> map) {
		return mDAO.selectList(ns+".infoList", map);
	}
	
	@Override
	public Map<Object,Object> infoDetail(Map<String,Object> map) {
		return mDAO.selectOne(ns+".infoDetail", map);
	}
	
	@Override
	public int infoPageCount() {
		return mDAO.selectOne(ns+".infoPageCount") ;
	}
	
	@Override
	public int infoReplyInsert(Map<String, Object> map) {
		return mDAO.insert(ns+".infoReplyInsert",map);
	}
	
	@Override
	public List<Map<Integer,Object>> infoReplyList(Map<String,Object> map) {
		return mDAO.selectList(ns+".infoReplyList", map);
	}
	
	@Override
	public List<Map<Integer,Object>> infoRReplyList(Map<String,Object> map) {
		return mDAO.selectList(ns+".infoRReplyList", map);
	}
	
	@Override
	public int infoDelete(Map<String,Object> map) {
		return mDAO.delete(ns+".infoDelete", map) ;
	}
	
	@Override
	public int infoUpdate(Map<String,Object> map) {
		return mDAO.update(ns+".infoUpdate", map) ;
	}
	
	@Override
	public int nInsert(Map<String, Object> map) {
		return mDAO.insert(ns+".noticeInsert",map);
	}

	@Override
	public int totalCount() {
		return mDAO.selectOne(ns+".totalCount");
	}

	@Override
	public List<Map<String, Object>> noticeList(Map<String, Object> map) {
		return mDAO.selectList(ns+".noticeList",map);
	}

	@Override
	public void countUp(Map<String, Object> map) {
		mDAO.update(ns+".countUp",map);
	}

	@Override
	public Map<String, Object> noticeDetail(Map<String, Object> map) {
		return mDAO.selectOne(ns+".noticeDetail",map);
	}

	@Override
	public void noticeUpdate(Map<String, Object> map) {
		mDAO.update(ns+".noticeUpdate",map);
	}

	@Override
	public void noticeDelete(Map<String, Object> map) {
		mDAO.delete(ns+".noticeDelete",map);
	}
}