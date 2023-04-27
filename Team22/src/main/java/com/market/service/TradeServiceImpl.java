package com.market.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.market.domain.ReviewVO;
import com.market.domain.TradeVO;
import com.market.persistence.TradeDAO;

@Service
public class TradeServiceImpl implements TradeService{
	
	private static final Logger logger = LoggerFactory.getLogger(TradeServiceImpl.class);
	
	@Inject
	private TradeDAO tdao;
	
	@Override
	public List<Map<String,Object>> getBuyReview() throws Exception {
		
		return tdao.buyReviewList();
	}

	@Override
	public List<TradeVO> tSellReview() throws Exception {
		
		return tdao.tSellReview();
	}

	@Override
	public List<Map<String,Object>> buyList() throws Exception {
		
		
		return tdao.buyList();
		
	}
	
	@Override
	public List<Map<String,Object>> prodList() throws Exception {
		
		
		return tdao.prodList();
		
	}

	@Override
	public void writeReview(ReviewVO rvo) throws Exception {
		tdao.insertReview(rvo);
	}

	@Override
	public void memberScore(double score) throws Exception {
		tdao.avgScore(score);
	}

	
	
	
}
