package com.market.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.market.domain.CustomerserviceVO;
import com.market.domain.MemberVO;
import com.market.domain.NoticeVO;
import com.market.domain.ProductVO;
import com.market.domain.TradeVO;
import com.market.persistence.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO adao;
	
	private static final Logger logger 
	        = LoggerFactory.getLogger(AdminServiceImpl.class);

	@Override
	public List<MemberVO> memberList() throws Exception {
		return adao.getMemebrList();
	}

	@Override
	public List<ProductVO> productList() throws Exception {
		return adao.getProductList();
	}

	@Override
	public void writeNotice(NoticeVO vo) throws Exception {
		   adao.createNotice(vo);
	}

	@Override
	public List<NoticeVO> noticeList(int displayPost, int postNum, String searchType, String keyword) throws Exception {
		
		return adao.getNoticeList(displayPost, postNum, searchType, keyword);
	}

	@Override
	public int searcountNotice(String searchType, String keyword) throws Exception {
		
		return adao.searcountNotice(searchType, keyword);
	}
	
	
	@Override
	public int countNotice() throws Exception {
	
		return adao.countNotice();
	}

	@Override
	public void updateReadCnt(Integer noti_num) throws Exception {
		adao.addReadcnt(noti_num);
	}

	@Override
	public NoticeVO getBoard(Integer noti_num) throws Exception {
		return adao.getNotice(noti_num);
	}

	@Override
	public Integer modifyBoard(NoticeVO uvo) throws Exception {
		return adao.updateBoard(uvo);
	}
	
	@Override
	public Integer deleteNotice(Integer noti_num) throws Exception {
         return adao.deleteNotice(noti_num);
	}

	@Override
	public int countMember() throws Exception {
		
		return adao.countMember();
	}

	@Override
	public int countProduct() throws Exception {
		
		return adao.countProduct();
	}

	@Override
	public List<Map<String, Object>> getbuyprodList() throws Exception {
		
		return adao.getbuyprodList();
	}

	@Override
	public List<Map<String, Object>> getsellprodList() throws Exception {
		
		return adao.getsellprodList();
	}

	@Override
	public int countTrade() throws Exception {
		
		return adao.countTrade();
	}

	@Override
	public List<CustomerserviceVO> getCsList() throws Exception {

		return adao.getCsList();
	}

	@Override
	public List<NoticeVO> getNotiList() throws Exception {
	
		return adao.getNotiList();
	}

	
	
	
	


}
