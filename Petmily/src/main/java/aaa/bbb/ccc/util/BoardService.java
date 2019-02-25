package aaa.bbb.ccc.util;

import java.util.List;
import java.util.Map;

public interface BoardService {
	int infoInsert(Map<String,Object> map);
	
	List<Map<Integer,Object>> infoList(Map<String,Object> map);
	
	Map<Object,Object> infoDetail(Map<String,Object> map);
	
	int infoPageCount();
	
	int infoReplyInsert(Map<String,Object> map);
	
	List<Map<Integer,Object>> infoReplyList(Map<String,Object> map);
	
	List<Map<Integer,Object>> infoRReplyList(Map<String,Object> map);
	
	int infoDelete(Map<String,Object> map);
	
	int infoUpdate(Map<String,Object> map);
	
	int nInsert(Map<String, Object> map);

	int totalCount();

	List<Map<String, Object>> noticeList(Map<String, Object> map);

	void countUp(Map<String, Object> map);

	Map<String, Object> noticeDetail(Map<String, Object> map);

	void noticeUpdate(Map<String, Object> map);

	void noticeDelete(Map<String, Object> map);
}