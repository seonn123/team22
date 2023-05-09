<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>My Page</title>
		<style type="text/css">
		body{
  padding: 0;
  margin: 0;
}
div{
  box-sizing: border-box;
}


/* alert badge */
.circle{
  display: inline-block;
  width: 5px;
  height: 5px;
  border-radius: 2.5px;
  background-color: #ff0000;
  position: absolute;
  top: -5px;
  left: 110%;
}

/* 파랑색 테스트 */
.rightBlue{
  color: #3F72AF;
}

.wrap{
  background-color: #F8F8F8;  
}
/* 녹색배경 */
.greenContainer{  
  height: 132px;
  background-color: #24855b;    
  
  display: flex;
  align-items: flex-end;
  padding: 16px;
}

.greenContainer .name{
   font-size: 20px;
  font-weight: bold;
  color: #ffffff;
} 
.greenContainer .modify{
  margin-left: auto;
}

/* 단골상점 , 상품후기 , 적립금 박스 */
.summaryContainer{
  background-color: white;  
  display: flex;  
  padding: 21px 16px;  
  height: 90px;
  margin-bottom: 10px;
}
/* 단골상점 , 상품후기 , 적립금 */
.summaryContainer .item{
  flex-grow: 1
}
/* 파란 숫자 */
.summaryContainer .rightBlue{
  font-size: 19px;
  font-weight: bold;
  color: #3F72AF;
}
/* 텍스트 */
.summaryContainer .item > div:nth-child(2){
  font-size: 13px;
}

/* ================== 주문/배송조회 박스 시작 ==================== */
.shippingStatusContainer{
  padding: 21px 16px;
  background-color: white;
  margin-bottom: 10px;
}

/* 주문/배송조회 타이틀 */
.shippingStatusContainer .title{
  font-size: 16px;
  font-weight: bold;
  margin-bottom: 15px;
}

/* 장바구니 결제완료 배송중 구매확정 [로우] */
.shippingStatusContainer .status{
  display: flex;
  justify-content: space-between;
  margin-bottom: 21px;
}
/* 장바구니 결제완료 배송중 구매확정 [아이템]  */
.shippingStatusContainer .item{
  display: flex;
}

.shippingStatusContainer .number{
  font-size: 31px;
  font-weight: 500;
  text-align: center;
}
.shippingStatusContainer .text{
  font-size: 25px;
  font-weight: normal;
  color: black;
  font-weight : bold;
  text-align: center;
}
.shippingStatusContainer .memberUpdate{
  font-size: 14px;
  font-weight: normal;
  color: #769fcd;
  font-weight : bold;
  text-align: center;
}
.shippingStatusContainer .icon{
  display: flex;
  align-items: center;
  padding: 20px;
  width: 16px;
  height: 16px;
}


/*=================== 주문목록 ~ 찜한상품 리스트 ==================*/
.listContainer{  
  padding: 0;
  background-color: #ffffff;
  margin-bottom: 10px;
}
.listContainer .item{  
  display: flex;
  align-items: center;
  padding: 16px;
  color: black;
  text-decoration: none;  
  height: 56px;
  box-sizing: border-box;
}
.listContainer .icon{  
  margin-right: 14px;
}
.listContainer .text{
  font-size: 16px;
  position: relative;
}
.listContainer .right{
  margin-left: auto;
}


/*=================== 내지갑의 보유 적립금 들어가는 부분 ================*/
.listContainer .smallLight{
  font-size: 14px;
  color: #c2c2c2;  
}
.listContainer .smallLight > span{
  margin-left: 10px;
}

.listContainer .right .blct{
  font-size: 14px;
  font-weight: bold;
  margin-right: 5px;
}



/* 공지사항 이용안내 고객센터 */
.infoContainer{
  background-color: white; 
  display: flex;
  height: 100px;
  margin-bottom: 10px;  
  text-decoration: none;
}

/* .infoContainer .item{
  flex-grow: 1;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  font-size: 13px;
  text-decoration: none;
  color: black;
} */
.infoContainer .item{
  flex-grow: 1;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  font-size: 23px;
  text-decoration: none;
  color: 769fcd;
  font-weight: bold;
  border-bottom: solid 5px #769fcd;
} 

/* .infoContainer .item > div:first-child{
  margin-bottom: 2px;
} */



/*  */
.listContainer .item:hover{
/*   background-color: #f8f8f8; */
}
.infoContainer .item:hover{
/*   background-color: #f8f8f8; */
}

.sold-out {
  filter: brightness(35%);
  opacity: 0.5;
}

.image-container {
  position: relative;
  display: inline-block;
}

.sold-out-text {
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  background-color: rgba(0, 0, 0, 0.8);
  color: #fff;
  text-align: center;
  font-size: 18px;
  font-weight: bold;
  padding: 20px 0;
}

		
		</style>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
	</head>
	<body>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<%@ include file="../include/header.jsp" %>
								<%@ include file="../include/myPage.jsp" %>
								
										<div class="shippingStatusContainer">
										<section>
										<div class="infoContainer">
									    <a href="/trade/mySaleProduct" class="item">
									      <div>판매중</div>
									    </a>    
									    <a href="/trade/soldProduct" class="item">
									      <div>판매완료</div>
									    </a>    
									   
									  </div>
									  		<div class="infoContainer">
				  <a href="/trade/soldProduct" class="button" style="display: inline-block; float: right;">일반</a>
				  <a href="/trade/soldAuction" class="button" style="display: inline-block; float: right;">경매</a>
				<a href="/trade/soldRandom" class="button" style="display: inline-block; float: right;">응모</a>
									  		</div>			  
									<header class="major">
									
									</header>
									<div class="posts">
									
										<c:forEach var="vo" items="${soldAuction }">
							<article>
								
								<a class="product-section" href="/auction/aDetail?au_num=${vo.au_num }">
									
									
								<div class="image-container">
								<img class="sold-out" src="/resources/images/${vo.au_pic.split(',')[0] } " width="511px" height="306px" 
									onerror="this.src='/resources/images/default_product.jpg'">
							    <div class="sold-out-text">판매 완료</div>
							    </div>
								
								
								<div>구매자 : ${vo.buy_mem_id }</div>
								
								<div style="float:left;">
								<div>상품명 : ${vo.product_title }</div>
									가격 : <fmt:formatNumber value="${vo.au_endPrice }" pattern="#,###" />원
								</div>
								
								</a>	
									
								
								
								
								
						<a href="#" style="float:right;">
						          <div>상품삭제</div></a> 
			
				</article>
				
			</c:forEach>
									</div>
								</section>
									</div>
									
	
						</div>
					</div>

					<%@ include file="../include/sidebar.jsp" %>
			</div>

		<!-- Scripts -->
			<script src="/resources/assets/js/jquery.min.js"></script>
			<script src="/resources/assets/js/skel.min.js"></script>
			<script src="/resources/assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="/resources/assets/js/main.js"></script>

<script type="text/javascript">

$(document).ready(function() {

    
    function heartChange($svg1, $svg2, pnum, seller) {
        $svg1.on('click', function(event) {
            $.ajax({
                type: 'GET',
                url: '/product/likeProdCancel',
                data: {product_num: pnum, seller: seller},
                success: function() {
                    console.log('success Del');
                    $svg1.hide();
                    $svg2.show();
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.log('Failed to cancel like');
                    console.log(jqXHR.responseText);
                    console.log(textStatus);
                    console.log(errorThrown);
                }
            });
        });

        $svg2.on('click', function(event) {
            $.ajax({
                type: 'GET',
                url: '/product/likeProd',
                data: {product_num: pnum, seller: seller},
                success: function() {
                	console.log('success Reg');
                	$svg2.hide();
                    $svg1.show();
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.log("Save Failed");
                    console.log(jqXHR.responseText);
                    console.log(textStatus);
                    console.log(errorThrown);
                }
            });
        });
    }
    
    $(".div-likeit").each(function() {
    	
    	var $div = $(this);
        var pnum = $div.data('product-num');
        var seller = "${id}";
        var $svg1 = $div.find('.svg-1');
        var $svg2 = $div.find('.svg-2');

        $.ajax({
        	type: 'GET',
        	url: '/product/memlikeCheck',
        	data: {product_num: pnum, seller: seller},
        	success: function(response){
        		if(response){
        			$svg2.hide();
        			$svg1.show();
        		}else{
        			$svg1.hide();
        			$svg2.show();
        		}
        		heartChange($svg1, $svg2, pnum, seller)
    		},
    		error: function(response){
    			console.log(pnum + '번 상품 찜 확인 실패');
        	}
        });
    });
});

</script>

	</body>
</html>