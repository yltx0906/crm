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
  <title>Document</title>
  <link rel="stylesheet" href="./layui/css/layui.css">
</head>
<body>
  <div class="list">
  <span class="layui-breadcrumb" style="margin-left:20px;margin-top:30px">
  <a href="">首页</a>
  <a href="">列表页</a>
  <a href="">客户编辑页面</a>
  
</span>
</div>
  <div class="listOne">
 
  </div>

  <div  class="tab">
    <table  class="layui-table" >
  <colgroup>
    <col width="150">
    <col width="200">
    <col>
  </colgroup>
  <thead >
    <tr >
      <th>地点</th>
      <th>概要</th>
      <th>详情</th>
      

   
    <th style="text-align:center">操作</th>
    


    </tr> 
  </thead>
  <tbody>
   <c:forEach items="${activitys}" var="activity">
	    <tr>
	      <td>${activity.atv_place }</td>
	      <td>${activity.atv_title }</td>
	      <td>${activity.atv_desc }</td>
	      
	     
	      <td class="test" style="text-align:center;">
	        <i  class="layui-icon layui-icon-upload-circle" style="font-size: 20px; color: #1E9FFF;padding:15px"></i> 
	        <i id="first" value="${activity.atv_id }" class="layui-icon layui-icon-edit" title="编辑" style="font-size: 20px; color: #1E9FFF;padding:15px"></i>  
	        <i value="${activity.atv_id }" class="layui-icon layui-icon-delete" title="删除" style="font-size: 20px; color: #1E9FFF;padding:15px"></i>
	          
	      </td>
	
	    </tr>
    </c:forEach>
  </tbody>
</table>
</div>
   <div class="layui-input-block">
      <button style="margin-left:900px"   class="layui-btn" lay-submit lay-filter="formDemo">确认信息</button>
      
    </div>
    <div id="test1" style="margin-left:500px"></div>
  <script src="./layui/layui.all.js"></script>
</body>
</html>
<script>
  

  $(function(){
  $('.layui-input-block').on({
    click:function(){
      $('.layui-body').load('./pages/Info_find.html');
       
    }
  },'button');
});
//新建
  $('.layui-icon-upload-circle').on('click', function(){
    layer.open({
      type: 1,
      area: ['600px', '300px'],
      shadeClose: true, //点击遮罩关闭
      content: ` <form id="atvFrom2" action="cust/addActivities" method="post"> 
      <div class="layui-form-item">
      <%--  <input id="hidden4" type="hidden" name="atv_cust_id" value="${cust_id}" >  --%>
        
    <label class="layui-form-label">地点</label>
    <div class="layui-input-block">
      <input type="text" name="atv_place" required  lay-verify="required" placeholder="请输入地点" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">概要</label>
    <div class="layui-input-block">
      <input type="text" name="atv_title" required  lay-verify="required" placeholder="请输入概要" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">详情</label>
    <div class="layui-input-block">
      <input type="text" name="atv_desc" required  lay-verify="required" placeholder="请输入详情" autocomplete="off" class="layui-input">
    </div>
  </div>
  
  
    <div class="layui-input-block">
      <button id="btn2" class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
    </div>
  </div>
  </form>`
          });
        });
//编辑
  $('.layui-icon-edit').on('click', function(){
	  var atv_id = $(this).attr('value');
    layer.open({
      type: 1,
      area: ['600px', '300px'],
      shadeClose: true, //点击遮罩关闭
      content: `
   <form id="atvFrom1" action="cust/updateActivity" method="post">        
    <input type="hidden" id="atvHidden1" name="atv_id" value="">
  <div class="layui-form-item">
    <label class="layui-form-label">地点</label>
    <div class="layui-input-block">
      <input type="text" name="atv_place" required  lay-verify="required" placeholder="请输入地点" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">概要</label>
    <div class="layui-input-block">
      <input type="text" name="atv_title" required  lay-verify="required" placeholder="请输入概要" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">详情</label>
    <div class="layui-input-block">
      <input type="text" name="atv_desc" required  lay-verify="required" placeholder="请输入详情" autocomplete="off" class="layui-input">
    </div>
  </div>
  
  
    <div class="layui-input-block">
      <button id="btn1" class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
    </div>
  </div>
</form>`
    });

    $('#atvHidden1').attr('value',atv_id);

  });



layui.use('layer', function(){
      var layer = layui.layer;
      $(document).on('click','#reset',function(){
          $('.layui-layer-shade').css('display','none');
          $('.layui-layer').css('display','none');

       });
    });       

//新建
$('#btn2').on('click', function(){
    layer.confirm('确认提交？', {

}, function(){
    $('#atvForm2').submit();
	
 layer.msg('提交成功', {icon: 1});
}, function(){
 layer.msg('也可以这样', {
   time: 20000, //20s后自动关闭
   btn: ['明白了', '知道了']
 });
});
   
   
 });
//编辑
$('#btn1').on('click', function(){
    
    layer.confirm('确认提交？', {

}, function(){
	$('#atvForm1').submit();
 layer.msg('提交成功', {icon: 1});
}, function(){
 layer.msg('也可以这样', {
   time: 20000, //20s后自动关闭
   btn: ['明白了', '知道了']
 });
});
   
   
 });





//删除
   $('.layui-icon-delete').on('click', function(){
	   var atv_id = $(this).attr('value'); 
             layer.confirm('确认删除？', {
         
        }, function(){
        	 $('.layui-body').load('cust/deleteOneActivity?atv_id='+atv_id);
          layer.msg('删除成功', {icon: 1});
        }, function(){
          layer.msg('也可以这样', {
            time: 20000, //20s后自动关闭
            btn: ['明白了', '知道了']
          });
        });
            
            
          });


   

   

</script>

