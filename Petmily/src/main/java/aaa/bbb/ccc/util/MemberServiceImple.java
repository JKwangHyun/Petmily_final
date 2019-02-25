package aaa.bbb.ccc.util;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import aaa.bbb.ccc.vo.MemberVO;

@Service
public class MemberServiceImple implements MemberService {

	@Inject
	private SqlSession mDAO ;
	
	private static final String ns ="banana.apple.mapper.memberMapper";

	@Override
	public MemberVO memberDetail(MemberVO mvo) {
		return mDAO.selectOne(ns+".memberDetail", mvo) ;
	}
	@Override
	public MemberVO idcheck(MemberVO mvo) {
		return mDAO.selectOne(ns+".idcheck", mvo) ;
	}
	@Override
	public MemberVO findId(MemberVO mvo) {
		return mDAO.selectOne(ns+".findId", mvo) ;
	}
	@Override
	public MemberVO findPw(MemberVO mvo) {
		return mDAO.selectOne(ns+".findPw", mvo) ;
	}
	@Override
	public int newPw(MemberVO mvo) {
		return mDAO.update(ns+".newPw",mvo) ;
	}
	@Override
	public int memberInsert(MemberVO mvo) {
		return mDAO.insert(ns+".memberInsert",mvo);
	}

	@Override
	public int memberDelete(MemberVO mvo) {
		return mDAO.delete(ns+".memberDelete",mvo);
	}

	@Override
	public int memberUpdate(MemberVO mvo) {
		return mDAO.update(ns+".memberUpdate",mvo);
	}

	@Override
	public int imgUpdate(MemberVO mvo) {
		return mDAO.update(ns+".imgUpdate",mvo);
	}
}