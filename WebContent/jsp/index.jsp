<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
 <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>" />
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

  <title>客户关系管理</title>
  <link rel="stylesheet" href="./layui/css/layui.css">
  
  <script src="./js/jquery-3.3.1.min.js"></script>
  <script src="./js/route.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo"></div>
     <div class="layui-logo" style="font-size:18px;font-weight:bolder;">crm管理系统</div>
  
     <i class="layui-icon layui-icon-chart-screen" ></i>
      <i class="layui-icon layui-icon-search" ></i>

      <i class="layui-icon layui-icon-friends" ></i>
       <i class="layui-icon layui-icon-notice"></i>

    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
          <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
          	${user.usr_name}
        </a>
        <dl class="layui-nav-child">
          <dd><a href="OwnConfig">个人信息</a></dd>
          <dd><a href="#">安全设置</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item"><a href="sign">退出</a></li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test" style="height:800px">
      <c:if test="${user.usr_role_id == 4 || user.usr_role_id == 3}">
        <li class="layui-nav-item layui-nav-itemed">
          <a class="" href="javascript:;"><span style="font-size:15px">营销管理</span></a>
          <dl class="layui-nav-child">
          <c:if test="${user.usr_role_id == 3}">
            <dd><a href="javascript:;">销售机会管理</a></dd>
            </c:if>
            <c:if test="${user.usr_role_id == 4 }">
            <dd><a href="javascript:;">客户开发计划</a></dd>
            </c:if>
          </dl>
        </li>
       </c:if> 
       
        <c:if test="${user.usr_role_id==4 }">
        <li class="layui-nav-item">
          <a href="javascript:;"><span style="font-size:15px">客户管理</span></a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:;">客户信息查询</a></dd>
            <dd><a href="javascript:;">客户信息添加</a></dd>
           
          </dl>
        </li>
        </c:if>
        
        	<c:if test="${user.usr_role_id == 4 || user.usr_role_id == 3}">
        <li class="layui-nav-item">
          <a href="javascript:;"><span style="font-size:15px">服务管理</span></a>
          <dl class="layui-nav-child">
          	<c:if test="${user.usr_role_id == 3}">
            <dd><a href="javascript:;">服务反馈</a></dd>
            </c:if>
            	<c:if test="${user.usr_role_id == 4 }">
            <dd><a href="javascript:;">服务处理</a></dd>
           </c:if>
          </dl>
        </li>
        </c:if>
        
                <c:if test="${user.usr_role_id==2 }">
        <li class="layui-nav-item">
          <a href="javascript:;"><span style="font-size:15px">统计报表</span></a>
          <dl class="layui-nav-child">
          
            <dd><a href="javascript:;">客户贡献分析</a></dd>
            <dd><a href="javascript:;">客户构成分析</a></dd>
           
          </dl>
        </li>
        </c:if>
        
                <c:if test="${user.usr_role_id==1 }">
         <li class="layui-nav-item">
          <a href="javascript:;"><span style="font-size:15px">系统设置</span></a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:;">角色管理</a></dd>
            <dd><a href="javascript:;">用户管理</a></dd>
             
           
          </dl>
        </li>
        </c:if>
       
       
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <div>
      <div class="center">
        <div class="BgTitle">
          welcome >>
        </div>
        <div class="SmTitle">
         欢迎来到crm后台系统
        </div>
        <div class="LianJie">
          一点链接，协同所有
        </div>
        <div class="picu">
          <img src="./layui/images/text.png" alt="">
        </div>
      </div>



    </div>
  </div>
  
  <div class="layui-footer">
    <!-- 底部固定区域 -->
    昆山杰普软件公司
  </div>
</div>
<script src="./layui/layui.all.js"></script>


</body>
</html>
<style>
  .BgTitle{
    font-size:50px;
    color:#be6740;
    padding:30px;
  }
  .SmTitle{
    font-size:20px;
    color:#dcd8d6;
    margin-left:30px;
  }
  .LianJie{
    font-size:25px;
    color:#be6740;
    position: absolute;
    left:450px;
    top:200px;
  }
  .picu{
    width:300px;
    height:300px;
    
    position: absolute;
    left:420px;
    top:300px;
  }

</style>