<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="page-container page-header header-shadow">
<header>
  <a href="./">
    <img class="nav-logo"  src="images/cake/cakeimg/LOGO-1.png" alt="">
  </a>
 
  <nav class="nav-menu">
        <a  href="jsp/cake/index.jsp"  class="nav-a active">
        <span> 首页<span class="sr-only">(current)</span></span>
        <span> HOME</span>
    </a>

        <a  href="CakeList"  class="nav-a " >
        <span> 所有商品</span>
        <span> PRODUCTS</span>
    </a>

        <a  href="CakeList?catalogId=9"  class="nav-a ">
        <span> 下午茶点</span>
        <span> TEA TIME</span>
    </a>

        <a  href="CakeList?catalogId=8"  class="nav-a ">
        <span> 生如夏花 </span>
        <span> SUMMER FLOWERS</span>
    </a>

        <a  href="CakeList?catalogId=7"  class="nav-a ">
        <span> 草莓红颜 </span>
        <span> STRAWBERRY BEAUTY</span>
    </a>

    </nav> 
     <img class="nav-cut-line" src="images/cake/cut-line.png" alt="">
 			 <div class="header-controller">
  					<c:choose>
							<c:when test="${empty landing}">
								 <div class="header-controller-login">
								     <a href="jsp/cake/login.jsp">
								     	<img class="icon" src="images/cake/login-icon.png" alt="">
								     	<span class="text" id="uname">登录</span>
								     </a>
								 </div>
								 <div class="header-controller-register" id="regBar_350">
								 	<a href="jsp/cake/reg.jsp">
								        <img class="icon" src="images/cake/register-icon.png" alt="">
								        <span class="text">注册</span>
								    </a>
								</div>
							</c:when>
							<c:otherwise>
								<div class="btn-group adminName " style="margin-right:80px;margin-bottom:15px;">
									<a href="javascript:void(0)">
										<img class="icon" src="images/cake/login-icon.png" alt="">
									    ${landing.name} <span class="caret"></span>
									</a>
									<ul class="dropdown-menu dropdown-menu-right">
									    <li><a href="OrderServlet?action=list" >我的订单</a></li>
									    <li><a style="border-top:1px #ccc solid" href="UserServlet?action=off" onClick="return confirm('确定要退出登录吗？')">退 出 登 录</a></li>
									</ul>
								</div>
							</c:otherwise>
						</c:choose>

				<div class="header-controller-cart"  >
						<a id="cart" href="jsp/cake/cart.jsp">
							<div class="icon" style="display:inline-block; position: relative;">
					            <img class="icon" src="images/cake/cart-icon.png" style="margin-top:-50px;" alt="">
					            <div class="wz-dot" style="position: absolute;border: 5px solid transparent; border-bottom-color: #e60012; top: -7px;
					    			left: 10px;">
					            </div>
					        </div>
							<span>购物车</span>

							<span class="badge num" style="color:#e60012;font-size: 12px;background:#D3B145;">
								<c:choose>
									<c:when test="${!empty shopCart}">
										${shopCart.getTotQuan()}
									</c:when>
									<c:otherwise>
										0
									</c:otherwise>
								</c:choose>
							</span>
						</a>
					</div>
</div>
</header>
</div>