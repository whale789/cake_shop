<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();  
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	pageContext.setAttribute("basePath", basePath);
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<base href="${basePath}">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>GOOds</title>
	<link rel="stylesheet" href="bs/css/bootstrap.css">
	<script type="text/javascript" src="bs/js/jquery.min.js"></script>
	<script type="text/javascript" src="bs/js/bootstrap.js"></script> 
	<link rel="stylesheet" href="css/cake/head_footer.css" >
	<link rel="stylesheet" href="css/cake/cakelist.css" />
	<script type="text/javascript" src="js/cake/getCatalog.js"></script> 
	<script type="text/javascript" src="js/cake/landing.js"></script>
	<script type="text/javascript" src="js/cake/addcart.js"></script>
</head>
<body>

	<div class="container-fullid">
		<%@include file="header.jsp" %>
		
		<div class="wrapper">
			<!-- main start -->
			<div class="main container">
				<div class="row">
					<div class="col-md-2 main-left">
						<h3>商品分类</h3>
						<ul id="catalog-list">
							<li><a href="CakeList">所有商品</a></li>
							
						</ul>
					</div>
					<div class="search col-md-4 col-md-offset-6" style="margin-top:20px;">
						<div class="input-group">
							<form action="CakeList2" method="get">
		     	 				<input style="float: left;width: 160px;" type="text" class="form-control" name="seachname" placeholder="输入要搜索商品">
		       					&nbsp;&nbsp;&nbsp;
		       					<span style="float: left;width: 40px;" class="btn btn-default" type="submit" ><img class="icon" src="images/cake/search-icon.png" alt=""></span>
							</form>
   						</div>
					</div>
					<div class="col-md-10 main-right" style="margin-top:-52px;">
						<div class="pro col-md-12">
							<h3>商品列表——${title}</h3>
						
							<div class="pro-list">
								<ul class="row"> 
									<c:choose>
										<c:when test="${!empty cakeList}">
											<c:forEach items="${cakeList}" var="i">
												<li class="col-md-3">
													<div class="list">
														<a href="cakedetail?cakeId=${i.cakeId}">
															<img class="img-responsive" src="${i.upLoadImg.imgSrc}" />
														</a>
														<div class="proinfo">
															<h2>
																<a style="margin-left:10px;color:#333333;" href="cakedetail?cakeId=${i.cakeId}">${i.cakeName}</a>
															</h2>
															<p>
																<i>￥${i.price}</i>
																<button class="btn btn-xs" style="background:#333333; color:#fff;float:right; " onclick="addToCart(${i.cakeId})" href="javascript:void(0)" data-toggle="modal" data-target=".bs-example-modal-sm">
																<img class="cart-icon" src="images/cake/btn-cart-icon.png" alt="">
																购买</button>
																
															</p>
														</div>
													</div>
												</li>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<p style="text-align:center;font-size:20px;height:200px;">当前没有商品信息</p>
										</c:otherwise>
									</c:choose>
								</ul>
								<!-- 分页栏 -->
								<ul class="pager row">
									<li><button class="homePage btn btn-default btn-sm">首页</button></li>
									<li><button class="prePage btn btn-sm btn-default">上一页</button></li>
									<li>总共 ${pageBean.pageCount} 页 | 当前 ${pageBean.curPage} 页</li>
									<li>
										跳转到
										<div class="input-group form-group page-div">
											<input id="page-input" class="form-control input-sm" type="text" name="page"/>
											<span>
												<button  class="page-go btn btn-sm btn-default">GO</button>
											</span>
										</div>
									</li>
									<li><button class="nextPage btn btn-sm btn-default">下一页</button></li>
									<li><button class="lastPage btn btn-sm btn-default">末页</button></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@include file="footer.jsp" %>
	</div>
	
	<!--弹窗盒子start -->
	<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
	  	<div class="modal-dialog modal-sm">
	    	<div class="modal-content" style="margin-top:300px;">
	    		<div class="modal-body" style="color:green;font-size:20px;">
	    		  	<img class="icon" src="images/cake/success-icon.png" alt="">
				  	 已成功加入购物车
				</div>
	    			
	      		<div class="modal-footer">
	      			<a href="javascript:void(0)" type="button" class="btn btn-md btn-default" data-dismiss="modal">返回继续购物</a>
			        <a href="jsp/cake/cart.jsp" type="button" class="btn btn-md btn-success">立即去结算</a>
			    </div>
	    	</div>
	  	</div>
	</div>
	<!--弹窗盒子end -->		
<script type="text/javascript">
	//按钮禁用限制
	if("${pageBean.curPage}"==1){
		$(".homePage").attr("disabled","disabled");
		$(".prePage").attr("disabled","disabled");
	}
	if("${pageBean.curPage}"=="${pageBean.pageCount}"){
		$(".page-go").attr("disabled","disabled");
		$(".nextPage").attr("disabled","disabled");
		$(".lastPage").attr("disabled","disabled");
	}
	//按钮事件
	$(".homePage").click(function(){
		window.location="${bsePath}CakeList?action=list&page=1";
	})
	$(".prePage").click(function(){
		window.location="${basePath}CakeList?action=list&page=${pageBean.prePage}";
	})
	$(".nextPage").click(function(){
		
		window.location="${basePath}CakeList?action=list&page=${pageBean.nextPage}";
	})
	$(".lastPage").click(function(){
		window.location="${basePath}CakeList?action=list&page=${pageBean.pageCount}";
	})
	//控制页面跳转范围
	$(".page-go").click(function(){
		var page=$("#page-input").val();
		var pageCount=${pageBean.pageCount};
		if(isNaN(page)||page.length<=0){
			$("#page-input").focus();
			alert("请输入数字页码");
			return;
		}
		if(page > pageCount || page < 1 ){
			alert("输入的页码超出范围！");
			$("#page-input").focus(); 
		}else{
			window.location="${basePath}CakeList?action=list&page="+page;
		}
	}) 
	
		
		
</script>
</body>
</html>