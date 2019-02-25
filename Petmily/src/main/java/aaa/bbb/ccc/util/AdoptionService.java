package aaa.bbb.ccc.util;

import java.util.List;
import java.util.Map;

public interface AdoptionService {
	int registration(Map<String,Object> map);

	void countUp(Map<String, Object> map);

	List<Map<String, Object>> adoptionList(Map<String, Object> map);

	Map<String, Object> adoptionDetail(Map<String, Object> map);

	void adoptionDelete(Map<String, Object> map);

	List<Map<String, Object>> categoryList(Map<String, Object> map);

	void REinsert(Map<String, Object> map);

	List<Map<String, Object>> RElist(Map<String, Object> map);

	List<Map<String, Object>> RErelist(Map<String, Object> map);

	void completeUpdate(Map<String, Object> map);

	void insertLike(Map<String, Object> map);

	void deleteLike(Map<String, Object> map);

	void likeCount(Map<String, Object> map);

	Map<String, Object> likeCheck(Map<String, Object> map);

	List<Map<String, Object>> myAlist(Map<String, Object> map);

	List<Map<String, Object>> myLlist(Map<String, Object> map);
}