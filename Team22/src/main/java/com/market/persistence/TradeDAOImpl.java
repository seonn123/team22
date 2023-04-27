package com.market.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.market.domain.ReviewVO;
import com.market.domain.TradeVO;

@Repository
public class TradeDAOImpl implements TradeDAO{

	@Inject
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.market.mapper.tradeMapper";

	private static final Logger logger = LoggerFactory.getLogger(TradeDAOImpl.class);

	@Override
	public List<Map<String,Object>> buyReviewList() throws Exception {
		
		return sqlSession.selectList(NAMESPACE+".buyReviewList");
	}

	@Override
	public List<TradeVO> tSellReview() throws Exception {
		
		return sqlSession.selectList(NAMESPACE+".tSellReview");
	}

	@Override
	public List<Map<String,Object>> buyList() throws Exception {
		
		
		return sqlSession.selectList(NAMESPACE+".buyList");
	}
	
	@Override
	public List<Map<String,Object>> prodList() throws Exception {
		
		return sqlSession.selectList(NAMESPACE+".prodList");
	}

	@Override
	public void insertReview(ReviewVO rvo) throws Exception {
		
		 sqlSession.insert(NAMESPACE+".insertReview",rvo);
	}

	@Override
	public void avgScore(double score) throws Exception {
		
	}
	
	
	
	
}
