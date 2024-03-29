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
  <a href="">销售机会管理</a>
 
</span>
	</div>
	<div class="listOne">
		
	</div>
	<div class="inp">
		<form class="layui-form" action="">
  <div class="layui-form-item">
    
    <div class="layui-input-block" style="margin-left:20px">
      <input type="text" name="title"  placeholder="请输入客户名称"  class="layui-input" style="width:200px">
    </div>
  </div>
  
  <div class="layui-form-item">
    
    <div class="layui-input-block" style="margin-left: 230px;margin-top:-52px;">
      <select name="city">
        <option value=""></option>
        <option value="0">华中</option>
        <option value="1">华北</option>
        <option value="2">华南</option>
        <option value="3">华东</option>
        
      </select>
    </div>
  </div>
  
  <div class="layui-input-block" style="margin-left:450px;margin-top:-54px">
      <button id="fun" class="layui-btn" lay-submit lay-filter="formDemo">查询</button>
      <button type="reset" class="resrt">重置</button>
    </div>
  
</form>
<div class="btn" style="margin-top:-20px">
	<button  class="layui-btn layui-btn-lg layui-btn-normal">新增</button>
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
      <th>客户名称</th>
      <th>概要</th>
      <th>联系人</th>
      <th>联系人电话</th>
	  <th>商机指派</th>
	  <th>操作</th>


    </tr> 
  </thead>
  <tbody>
  <c:forEach items="${chances}" var="chance" varStatus="status" >
    <tr>
      <td>${status.index+1 }</td>
      <td>${chance.chc_cust_name }</td>
      <td>${chance.chc_title }</td>
      <td>${chance.chc_linkman }</td>
      <td>${chance.chc_tel }</td>
      <td>${chance.chc_due_to }</td>
      <td>
      	<i value="${chance.chc_id }" class="layui-icon layui-icon-edit" style="font-size: 20px; color: #1E9FFF;padding:15px"></i>  
      	<i value="${chance.chc_id }" class="layui-icon layui-icon-delete" style="font-size: 20px; color: #1E9FFF;padding:15px"></i>   
      </td>
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
	
     $('.layui-btn-normal').on('click', function(){
    layer.open({
      type: 1,
      area: ['600px', '360px'],
      shadeClose: true, //点击遮罩关闭
      content: `

      <form id="saleForm1" action="sale/addChance" method="post">

  <div class="layui-form-item" style="width:500px;">
    
    <div class="layui-input-block">
      <input style="width:400px;height:30px;margin-top:15px" type="text" name="chc_source" required  lay-verify="required" placeholder="请输入商机来源" autocomplete="off" class="layui-input">
    </div>

  
    <div class="layui-input-block">
      <input style="width:400px;height:30px;margin-top:15px" type="text" name="chc_cust_name" required  lay-verify="required" placeholder="请输入客户名称" autocomplete="off" class="layui-input">
    </div>
   
    <div class="layui-input-block">
      <input style="width:400px;height:30px;margin-top:15px" type="text" name="chc_rate" required  lay-verify="required" placeholder="请输入成功几率" autocomplete="off" class="layui-input">
    </div>
    
    <div class="layui-input-block">
      <input style="width:400px;height:30px;margin-top:15px" type="text" name="chc_title" required  lay-verify="required" placeholder="请输入商机概要" autocomplete="off" class="layui-input">
    </div>
  
    <div class="layui-input-block">
      <input style="width:400px;height:30px;margin-top:15px" type="text" name="chc_linkman" required  lay-verify="required" placeholder="请输入联系人" autocomplete="off" class="layui-input">
    </div>
    
    <div class="layui-input-block">
      <input style="width:400px;height:30px;margin-top:15px" type="text" name="chc_tel" required  lay-verify="required" placeholder="请输入联系电话" autocomplete="off" class="layui-input">
    </div>
   
    <div class="layui-input-block">
      <input style="width:400px;height:30px;margin-top:15px" type="text" name="chc_desc" required  lay-verify="required" placeholder="请输入商机描述" autocomplete="off" class="layui-input">
    </div>
   
    <div class="layui-input-block">
      <input style="width:400px;height:30px;margin-top:15px" type="text" name="chc_create_by" value="${user.usr_name}" readonly="readonly" required  lay-verify="required" placeholder="请输入创建人" autocomplete="off" class="layui-input">
    </div>

  </div>
 
   		<div class="layui-form-item">
          <select style="width:400px;height:30px;margin-left:110px" name="chc_addr" lay-verify="required">
            <option value="华中">请选择商机区域</option>
            <option value="华中">华中</option>
            <option value="华北">华北</option>
            <option value="华南">华南</option>
            <option value="华东">华东</option>
          </select>
      </div>
   		<div class="layui-form-item">
          <select style="width:400px;height:30px;margin-left:110px" name="chc_due_to" lay-verify="required">
            <option value="jingli">请选择商机处理人</option>
            <option value="jingli">jingli</option>
            <option value="lili">lili</option>
          </select>
      </div>






       <div class="layui-input-block">
      <button id="tweny"  class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
      
          </div>
  </form>

      `
    });
  });
      	 


     
$('.layui-icon-edit').on('click', function(){
	var chc_id = $(this).attr('value');
    layer.open({
      type: 1,
      title:'编辑信息',
      area: ['600px', '360px'],
      shadeClose: true, //点击遮罩关闭
      content:  `

      <form id="saleForm2" action="sale/updateChance" method="post">

    <input id="chcid" type="hidden" name="chc_id" value="" >
  <div class="layui-form-item" style="width:500px;">
    
    <div class="layui-input-block">
      <input style="width:400px;height:30px;margin-top:15px" type="text" name="chc_source" required  lay-verify="required" placeholder="请输入商机来源" autocomplete="off" class="layui-input">
    </div>

  
    <div class="layui-input-block">
      <input style="width:400px;height:30px;margin-top:15px" type="text" name="chc_cust_name" required  lay-verify="required" placeholder="请输入客户名称" autocomplete="off" class="layui-input">
    </div>
   
    <div class="layui-input-block">
      <input style="width:400px;height:30px;margin-top:15px" type="text" name="chc_rate" required  lay-verify="required" placeholder="请输入成功几率" autocomplete="off" class="layui-input">
    </div>
    
    <div class="layui-input-block">
      <input style="width:400px;height:30px;margin-top:15px" type="text" name="chc_title" required  lay-verify="required" placeholder="请输入商机概要" autocomplete="off" class="layui-input">
    </div>
  
    <div class="layui-input-block">
      <input style="width:400px;height:30px;margin-top:15px" type="text" name="chc_linkman" required  lay-verify="required" placeholder="请输入联系人" autocomplete="off" class="layui-input">
    </div>
    
    <div class="layui-input-block">
      <input style="width:400px;height:30px;margin-top:15px" type="text" name="chc_tel" required  lay-verify="required" placeholder="请输入联系电话" autocomplete="off" class="layui-input">
    </div>
   
    <div class="layui-input-block">
      <input style="width:400px;height:30px;margin-top:15px" type="text" name="chc_desc" required  lay-verify="required" placeholder="请输入商机描述" autocomplete="off" class="layui-input">
    </div>
   

  </div>
 
   		<div class="layui-form-item">
          <select style="width:400px;height:30px;margin-left:110px" name="chc_addr" lay-verify="required">
            <option value="华中">请选择商机区域</option>
            <option value="华中">华中</option>
            <option value="华北">华北</option>
            <option value="华南">华南</option>
            <option value="华东">华东</option>
          </select>
      </div>

       <div class="layui-input-block">
      <button id="tweny1"  class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
      
          </div>
  </form>

      `
    });
    
    $('#chcid').attr('value',chc_id);
    
  });
   
   		$('.layui-icon-delete').on('click', function(){
   			var chc_id = $(this).attr('value');
		     layer.confirm('确认删除？', {
		  //按钮
		}, function(){
			 $('.layui-body').load("sale/deleteChance?chc_id="+chc_id);
		  layer.msg('删除成功', {icon: 1});
		}, function(){
		  layer.msg('取消', {
		    time: 20000, //20s后自动关闭
		    btn: ['明白了', '知道了']
		  });
});
    
    
  });
    
    
 
        //新建
        $(document).on('click','#tweny',function(){
                      layer.confirm('确定提交？', {
          btn: ['确定','取消'] //按钮
        }, function(){
        	$('#saleForm1').submit();
          layer.msg('提交成功，点击关闭按钮关闭', {icon: 1});
        }, function(){
          layer.msg('重新提交', {
            time: 20000, //20s后自动关闭
            btn: ['明白了']
          });
        });
            
        });
        
        //编辑
        $(document).on('click','#tweny1',function(){
                      layer.confirm('确定提交？', {
          btn: ['确定','取消'] //按钮
        }, function(){
        	$('#saleForm2').submit();
          layer.msg('提交成功，点击关闭按钮关闭', {icon: 1});
        }, function(){
          layer.msg('重新提交', {
            time: 20000, //20s后自动关闭
            btn: ['明白了']
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
