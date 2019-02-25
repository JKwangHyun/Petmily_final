package aaa.bbb.ccc.util;

import aaa.bbb.ccc.vo.MemberVO;

public interface MemberService {
	MemberVO memberDetail(MemberVO mvo);
	
	MemberVO idcheck(MemberVO mvo);
	
	MemberVO findId(MemberVO mvo);
	
	MemberVO findPw(MemberVO mvo);
	
	int newPw(MemberVO mvo);
	
	int memberInsert(MemberVO mvo);

	int memberDelete(MemberVO mvo);

	int memberUpdate(MemberVO mvo);

	int imgUpdate(MemberVO mvo);
}