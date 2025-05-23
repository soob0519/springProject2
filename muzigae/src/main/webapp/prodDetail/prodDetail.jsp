<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	<!-- JSTL 연결 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!doctype html>
<html lang="ko">
	<head>
		<title>${dto.pname}</title>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="../css/style.css">
		
		<link rel="stylesheet" href="/css/jquery-ui.css">
  		<link rel="stylesheet" href="/resources/demos/style.css">
		<script src="https://kit.fontawesome.com/a7926a1c4d.js" crossorigin="anonymous"></script>
  		<script src="../js/jquery-3.7.1.js"></script>
  		<script src="../js/jquery-ui.js"></script>
  		
		<script src="../js/script.js"></script>
		
	</head>
	
	
	
	<script>
	    var productName = "${dto.pname}";
	    var productPrice = "${dto.rawPrice}";
	</script>
	
	
	
	<body>
	
		<!-- header -->
		<%@ include file="../include/header.jsp" %>
		
		<!-- 페이지 이동시 갱신되는 방식 -->
		<div class="page_path wrap">
			<ul class="flex_end">
				<li>
					<a href="/home_page">home</a>
				</li>
				<li>
					<a href="/prodTotalList">shop</a>
				</li>
				<li>
					<a href="/prodList">${dto.item }</a>
				</li>
			</ul>
			<span class="blind">현재페이지</span>
		</div>


		
		
		
		<div class="contents flex_between detail_wrap">
			<!-- 상세페이지 -->
			<article class="prod_detail">
				<section>
					<img src="../images/prod_detail/${dto.file2}" alt="detail_image" class="detail_image">
				</section>

				<section class="detail_review">
					<table class="de_board_tbl">
						<div class="de_board_tit flex_start">
							<p>상품리뷰(total)</p>
							<span>평균별점(이미지)</span>
							<span>평균/5</span>
						</div>
						<colgroup>
							<col width="10%">
							<col width="*">
						</colgroup>
						<tr>
							<th class="de_board_seq">No.</th>
							<td class="flex_between de_board_cont">
								<p class="de_board_cont_tit"><a href="#none">ReviewTitle</a></p>
								<ul class="de_board_cont_detail flex_end">
									<li>Writer</li>
									<li>Rdate</li>
									<li>Hits</li>
								</ul>
							</td>
						</tr>
					</table>
					<div class="de_sub_board_btn">
						<ul class="flex_end">
							<li class="mv_total_review_page">
								<a href="#none">전체보기</a>
							</li>
							<li class="write_review">
								<a href="#none">리뷰작성</a>
							</li>
						</ul>
					</div>
					
					<div class="paging_area flex_center">
						<button class="prev_btn" type="button" id="btn_prev">이전</button>
						<ul class="page_list flex_center">
							<li>
								<a href="#none" class="page_num">1</a>								
							</li>
							<li>
								<a href="#none" class="page_num">2</a>								
							</li>
						</ul>
						<button class="next_btn" type="button" id="btn_next">다음</button>
					</div>
					<!-- <div class="paging flex_center">
						<c:forEach var="p" begin="1" end="${totalPage}" >
							<a href="/nboardList?pageIndex=${p}">${p}</a>
						</c:forEach>
					</div> -->
					
				</section>


				<section class="detail_QnA">
					<table class="de_board_tbl">
						<div class="de_board_tit flex_start">
							<p>상품문의(total)</p>
						</div>
						<colgroup>
							<col width="10%">
							<col width="*">
						</colgroup>
						<tr>
							<th class="de_board_seq">No.</th>
							<td class="flex_between de_board_cont">
								<p class="de_board_cont_tit"><a href="#none">QnATitle</a></p>
								<ul class="de_board_cont_detail flex_end">
									<li>Writer</li>
									<li>Rdate</li>
									<li>Hits</li>
								</ul>
							</td>
						</tr>
					</table>
					
					<div class="de_sub_board_btn">
						<ul class="flex_end">
							<li class="mv_total_review_page">
								<a href="#none">전체보기</a>
							</li>
							<li class="write_review">
								<a href="#none">상품문의작성</a>
							</li>
						</ul>
					</div>
					
					<div class="paging_area flex_center">
						<button class="prev_btn" type="button" id="btn_prev">이전</button>
						<ul class="page_list flex_center">
							<li>
								<a href="#none" class="page_num">1</a>								
							</li>
						</ul>
						<button class="next_btn" type="button" id="btn_next">다음</button>
					</div>
					<!-- <div class="paging flex_center">
						<c:forEach var="p" begin="1" end="${totalPage}" >
							<a href="/nboardList?pageIndex=${p}">${p}</a>
						</c:forEach>
					</div> -->
					
				</section>
				
			</article>

			<!-- 주문 창 -->
			 <div class="guard">
				<article class="order_buy">
					<!-- 배송정보 -->
					<section>
						<table class="buy_tbl_info">
							<caption class="buy_tit">
								<h4 class="prod_h4">${dto.pname }</h4>
								<span>${dto.price }</span>
							</caption>
							<colgroup>
								<col width="40%">
								<col width="*">
							</colgroup>
							<tr>
								<th>국내/해외배송</th>
								<td>국or해</td>
							</tr>
							<tr>
								<th>배송방법</th>
								<td>택배</td>
							</tr>
							<tr>
								<th>배송비</th>
								<td>300,000,000 (가입시무료)</td>
							</tr>
							<tr>
								<th>후기</th>
								<td>00</td>
							</tr>
							<tr>
								<th>문의</th>
								<td>00</td>
							</tr>
						</table>
					</section>
					
					<!-- 구매옵션 선택 시작 -->
					<section>
						<div class="buy_main">
							<h5 class="prod_h5">옵션명</h5>

							<select name="buy_prod_option" id="buy_prod_option" class="buy_prod_option">
								<option value="">[필수] 옵션 선택</option>
								
									<c:forEach var="color" items="${colorList }">
										<option value="${color}">${color}</option>
									</c:forEach>
							</select>			
							
							<div class="buy_select_list">
								<ul class="flex_between">
									<li>
										<p>${dto.pname}</p>
										<span>${dto.color}</span>
									</li>
									<li class="flex_center">
										<a href="#none" class="quan_minus">-</a>
										<input type="text" class="quan" id="quan" value="1"/>
										<a href="#none" class="quan_plus">+</a>
										<i id="btn_cancle">x</i>
									</li>
									<li>
										<p class="item_price">${dto.price}</p>
									</li>
								</ul>
							</div>
						<!-- 구매옵션 선택 끝 -->


							<div class="flex_between buy_total">
								<p>TOTAL</p>
  								<i>
  									<span id="totalPrice" class="total_price">0</span>
  									<span>(<span id="totalCount">0</span>개)</span>
  								</i>
							</div>

							<div>
								<ul class="buy_btn_area flex_between">
									<li>
										<a href="#none">바로구매하기</a>
									</li>
									<li>
										<a href="#none"><i class="fa-solid fa-cart-shopping"></i></a>
									</li>
									<li>
										<a href="#none"><i class="fa-regular fa-heart"></i></a>
									</li>
								</ul>
							</div>

							<div class="kakao_pay">
								<ul class="flex_start">
									<li>
										<p>kakao</p>
										<span>간편구매</span>
									</li>
									<li><a href="#none">간편구매</a></li>
									<li><a href="#none">찜</a></li>
								</ul>
							</div>

							<div class="naver_pay">
								<ul class="flex_start">
									<li>
										<p>네e버</p>
										<span>네e버ID 간편구매</span>
									</li>
									<li><a href="#none">Npay</a></li>
									<li><a href="#none">찜</a></li>
								</ul>
							</div>
						</div>

						<!-- 추가상품 -->
						<!-- 
						<div class="buy_sub">
							<div class="flex_start buy_more">
								<p>추가구성상품</p>
								<span>추가 구매 선택</span>
							</div>
							<div class="buy_more_select">
								<ul>
									<li class="flex_between">
										<div class="buy_sub_image">
											<img src="../images/prod_sub1.png" alt="sub_item_image" class="sub_item1">
										</div>
										<div class="buy_sub_detail">
											<ul>
												<li>추가상품명</li>
												<li>금액</li>
												<li>상품선택</li>
												<li>
													<select name="sub_select" id="sub_select" class="buy_prod_option">
														<option value="">상품 선택</option>
														<option value="1">1</option>
													</select>
												</li>
											</ul>
										</div>
									</li>
								</ul>
							</div>
						</div>
						 -->
						
					</section>
				</article>
			</div>
		</div>

		<footer id="footer">
		</footer>
	</body>
</html>

