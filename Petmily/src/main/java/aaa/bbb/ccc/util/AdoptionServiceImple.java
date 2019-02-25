package aaa.bbb.ccc.util;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

@Service
public class AdoptionServiceImple implements AdoptionService {

	@Inject
	private SqlSession mDAO ;
	
	private static final String ns ="banana.apple.mapper.adoptionMapper";

	@Override
	public int registration(Map<String, Object> map) {
		return mDAO.insert(ns+".registration",map);
	}

	@Override
	public void countUp(Map<String, Object> map) {
		mDAO.update(ns+".countUp",map);
	}

	@Override
	public List<Map<String, Object>> adoptionList(Map<String, Object> map) {
		return mDAO.selectList(ns+".adoptionList",map);
	}

	@Override
	public Map<String, Object> adoptionDetail(Map<String, Object> map) {
		return mDAO.selectOne(ns+".adoptionDetail",map);
	}

	@Override
	public void adoptionDelete(Map<String, Object> map) {
		mDAO.delete(ns+".adoptionDelete", map);
	}

	@Override
	public List<Map<String, Object>> categoryList(Map<String, Object> map) {
		return mDAO.selectList(ns+".categoryList",map);
	}

	@Override
	public void REinsert(Map<String, Object> map) {
		mDAO.insert(ns+".REinsert",map);
		
	}

	@Override
	public List<Map<String, Object>> RElist(Map<String, Object> map) {
		return mDAO.selectList(ns+".RElist",map);
	}
	
	@Override
	public List<Map<String, Object>> RErelist(Map<String, Object> map) {
		return mDAO.selectList(ns+".RErelist",map);
	}

	@Override
	public void completeUpdate(Map<String, Object> map) {
		mDAO.update(ns+".completeUpdate",map);
		
	}

	@Override
	public void insertLike(Map<String, Object> map) {
		mDAO.insert(ns+".insertLike",map);
	}

	@Override
	public void deleteLike(Map<String, Object> map) {
		mDAO.delete(ns+".deleteLike",map);
	}

	@Override
	public void likeCount(Map<String, Object> map) {
		mDAO.update(ns+".likeCount",map);
	}

	@Override
	public Map<String, Object> likeCheck(Map<String, Object> map) {
		return mDAO.selectOne(ns+".likeCheck",map);
	}

	@Override
	public List<Map<String, Object>> myAlist(Map<String, Object> map) {
		return mDAO.selectList(ns+".myAlist",map);
	}

	@Override
	public List<Map<String, Object>> myLlist(Map<String, Object> map) {
		return mDAO.selectList(ns+".myLlist",map);
	}

}