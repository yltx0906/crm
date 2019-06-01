<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
 <base href="<%=basePath %>">
	<meta charset="UTF-8">
	<title>销售机会管理</title>
	<link rel="stylesheet" href="./layui/css/layui.css">
	<script src="./js/form.js"></script>
</head>
<body>
	<div class="list">
		<span class="layui-breadcrumb">
  <a href="">首页</a>
  <a href="">列表页</a>
  <a href="">客户开发计划</a>
 
</span>
	</div>
	<div class="listOne">
		
	</div>
	<div class="inp">
		<form class="layui-form" action="">
 
  
  <div class="layui-form-item">
    <label class="layui-form-label">选择框</label>
    <div class="layui-input-block">
      <select name="city">
        <option value=""></option>
        <option value="0">华中</option>
        <option value="1">华北</option>
        <option value="2">华南</option>
        <option value="3">华东</option>
        
      </select>
    </div>
  </div>
  
  <div class="layui-form-item">
   
  </div>
</form>
   <div class="layui-input-block" style="margin-left:330px;margin-top:-54px">
      <button id="fun" class="layui-btn" lay-submit lay-filter="formDemo">查询</button>
      <button type="reset" class="resrt">重置</button>
    </div>


	<div class="tab">
		<table class="layui-table">
  <colgroup>
    <col width="150">
    <col width="200">
    <col>
  </colgroup>
  <thead>
    <tr>
      <th>序号</th>
      <th>客户名</th>
      <th>概要</th>
      <th>联系人</th>
      <th>联系人电话</th>
	  <th>状态</th>
	  <th >操作</th>


    </tr> 
  </thead>
  <tbody>
  <c:forEach items="${chances2 }" var="chance2" varStatus="status">
    <tr>
      <td>${status.index+1 }</td>
      <td>${chance2.chc_cust_name }</td>
      <td>${chance2.chc_title }</td>
      <td>${chance2.chc_linkman }</td>
      <td>${chance2.chc_tel }</td>
      <c:if test="${chance2.chc_status == 1}">
      	<td>等待开发</td>
	      <td>
	      	 <i value="${chance2.chc_id }" class="layui-icon layui-icon-loading" style="font-size: 20px; color: #1E9FFF;"></i>   
	      </td>
	</c:if>
      <c:if test="${chance2.chc_status == 2}">
      	<td>正在开发</td>
	      <td>
	      	 <i value="${chance2.chc_id }" class="layui-icon layui-icon-fonts-code" style="font-size: 20px; color: #1E9FFF;"></i>  
	      </td>
	</c:if>
      <c:if test="${chance2.chc_status == 3}">
      	<td>开发成功</td>
	      <td>
	      	<i value="${chance2.chc_id }" class="layui-icon layui-icon-face-smile" style="font-size: 20px; color: #1E9FFF;"></i> 
	      </td>
	</c:if>
    </tr>
    </c:forEach>
    
    
  </tbody>
</table>
	</div>
 <div id="test1" style="margin-left:400px"></div>
<script>
  layui.use('laypage', function(){
  var laypage = layui.laypage;
  
  //执行一个laypage实例
  laypage.render({
    elem: 'test1' //注意，这里的 test1 是 ID，不用加 # 号
    ,count: 50 //数据总数，从服务端得到
  });
});
  


   
  $('.layui-icon-fonts-code').on('click', function(){
    layer.open({
      type: 1,
      title:'正在开发',
      area: ['600px', '300px'],
      shadeClose: true, //点击遮罩关闭
      content: `<form  id="planForm2" action="sale/updatePlan" method="post">
    <input id="pla_chc_id" type="hidden" name="pla_chc_id" value="" >
    <textarea style="width:400px;margin-left:110px" name="pla_todo" required lay-verify="required" placeholder="请输入开发计划" class="layui-textarea"></textarea>
    <br>
    <div class="layui-form-item">
    <select style="width:400px;height:30px;margin-left:110px" name="pla_result" lay-verify="required">
      <option value="继续开发">请选择开发结果</option>
      <option value="继续开发">继续开发</option>
      <option value="开发成功">开发成功</option>
    </select>
</div>
    
   <div class="layui-input-block">
  <button style="margin-top:10px" id="seven" class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
  
</div>
</form>`
    });
    var pla_chc_id = $(this).attr('value');
    $('#pla_chc_id').attr('value',pla_chc_id);
  });
  
  $('.layui-icon-loading').on('click', function(){
	  var pla_chc_id = $(this).attr('value');
    layer.open({
      type: 1,
      title:'等待开发',
      area: ['600px', '200px'],
      shadeClose: true, //点击遮罩关闭
      content: `<form  id="planForm1" action="sale/savePlan" method="post">
    <input id="pla_chc_id" type="hidden" name="pla_chc_id" value="" >
        <textarea style="width:400px;margin-left:110px" name="pla_todo" required lay-verify="required" placeholder="请输入开发计划" class="layui-textarea"></textarea>
        
       <div class="layui-input-block">
      <button style="margin-top:10px" id="six" class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
      
    </div>
    </form>`
    });
    $('#pla_chc_id').attr('value',pla_chc_id);
    
  });
   



    
//正在开发
      $(function () {
    layui.use('layer', function(){
        var $ = layui.jquery
            ,layer = layui.layer //弹层
 
        
        $(document).on('click','#seven',function(){
                      layer.confirm('确定提交？', {
          btn: ['确定','取消'] //按钮
        }, function(){
        	$('#planForm2').submit();
          layer.msg('提交成功，点击关闭按钮关闭', {icon: 1});
        }, function(){
          layer.msg('重新提交', {
            time: 20000, //20s后自动关闭
            btn: ['明白了']
          });
        });
            
        });
 
    });
 
}); 

//等待开发
       $(function () {
    layui.use('layer', function(){
        var $ = layui.jquery
            ,layer = layui.layer //弹层
 
        
        $(document).on('click','#six',function(){
                      layer.confirm('确定提交？', {
          btn: ['确定','取消'] //按钮
        }, function(){
        	$('#planForm1').submit();
          layer.msg('提交成功，点击关闭按钮关闭', {icon: 1});
        }, function(){
          layer.msg('重新提交', {
            time: 20000, //20s后自动关闭
            btn: ['明白了']
          });
        });
            
        });
 
    });
 
}); 

 $('#fun').click(function(){
      alert('查询');
    });


</script> 
	</div>

<script src="./layui/layui.all.js"></script>


</body>
</html>
