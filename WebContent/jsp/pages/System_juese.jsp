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
  <a href="">系统设置</a>
  <a href="">角色管理</a>
  
 
</span>
	</div>
	<div class="listOne">
		
	</div>
	<div class="inp">
		<form class="layui-form" action="">
  <div class="layui-form-item">
   
    <div class="layui-input-block" style="margin-left:20px">
      <input type="text" name="title" required  lay-verify="required" placeholder="请输入客户名称" autocomplete="off" class="layui-input">
    </div>
  </div>
  
  <div class="layui-form-item">
   
    <div class="layui-input-block" style="margin-left:230px;margin-top:-52px">
      <select name="city" lay-verify="required">
        <option value="">请选择地域</option>
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
<div class="layui-input-block" style="margin-left:450px;margin-top:-54px">
     <button id="fun" class="layui-btn layui-btn-normal">查询</button>
      <button type="reset" class="resrt">重置</button>
    </div>
<div class="btn">
	<button style="position: absolute;top:100px;left:1050px" class="layui-btn layui-btn-lg layui-btn-normal">新增</button>
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
      <th>角色名</th>
      <th>描述</th>
      <th>状态</th>
      
      <th >操作</th>


    </tr> 
  </thead>
  <tbody>
  	<c:forEach items="${roles }" var="role" varStatus="status" >
    <tr>
      <td>${status.index+1 }</td>
      <td>${role.role_name }</td>
      <td>${role.role_desc }</td>
      <c:if test="${role.role_flag == 1}">
      <td>正常</td>
     </c:if>
     <c:if test="${role.role_flag == 0}">
      <td>注销</td>
     </c:if>
      
      <td>
         <i value="${role.role_id }" class="layui-icon layui-icon-file" style="font-size: 20px; color: #1E9FFF;padding:15px"></i>  
         <i value="${role.role_id }" class="layui-icon layui-icon-delete" style="font-size: 20px; color: #1E9FFF;padding:15px"></i>  
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
      title:'新增角色',
      area: ['600px', '200px'],
      shadeClose: true, //点击遮罩关闭
      content: `<div style="padding:20px;">
    <form  action="sys/roleAdd" method="post">

    <div class="layui-form-item">
      
      <div class="layui-input-block">
        <input style="width:400px;height:30px;margin-top:15px"  type="text" name="role_name" required   placeholder="请输入角色名称" autocomplete="off" class="layui-input">
      </div>

     
      <div class="layui-input-block">
        <input style="width:400px;height:30px;margin-top:15px" type="text" name="role_desc" required   placeholder="请输入角色描述"  autocomplete="off" class="layui-input">
      </div>
     
      <div class="layui-input-block">
      <select  style="width:400px;height:30px;margin-top:15px" name="role_flag" lay-verify="required" placeholder="请选择角色状态" autocomplete="off" class="layui-input">
      <option value="1">请选择角色状态</option>
      <option value="1">正常</option>
      <option value="0">注销</option>
      
    </select>
      </div>
     
   	</div>
       
  	<div class="layui-input-block">
        <button id="five1" class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
        
      </div>
    </form>


        </div>`
    });
  });



	$('.layui-icon-file').on('click', function(){
		var role_id = $(this).attr('value');
    layer.open({
      type: 1,
      title:'编辑角色',
      area: ['600px', '200px'],
      shadeClose: true, //点击遮罩关闭
      content:`<div style="padding:20px;">
    <form  action="sys/roleUpdate" method="post">

    <div class="layui-form-item">
      <input type="hidden" id="rolehidden1" name="role_id" value="">
      <div class="layui-input-block">
        <input style="width:400px;height:30px;margin-top:15px"  type="text" name="role_name" required   placeholder="请输入角色名称" autocomplete="off" class="layui-input">
      </div>

     
      <div class="layui-input-block">
        <input style="width:400px;height:30px;margin-top:15px" type="text" name="role_desc" required   placeholder="请输入角色描述" autocomplete="off" class="layui-input">
      </div>
     
      <div class="layui-input-block">
      <select  style="width:400px;height:30px;margin-top:15px" name="role_flag" lay-verify="required" placeholder="请选择角色状态" autocomplete="off" class="layui-input">
      <option value="1">请选择角色状态</option>
      <option value="1">正常</option>
      <option value="0">注销</option>
      
    </select>
      </div>
     
   	</div>
       
  	<div class="layui-input-block">
        <button id="five2" class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
        
      </div>
    </form>


        </div>`
    });
    $('#rolehidden1').attr('value',role_id);
  });

   $(function () {
    layui.use('layer', function(){
        var $ = layui.jquery
            ,layer = layui.layer //弹层
 
        
        $(document).on('click','#five2',function(){
                      layer.confirm('确定提交？', {
          btn: ['确定','取消'] //按钮
        }, function(){
        	$('#five2').submit();
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

        $(function () {
    layui.use('layer', function(){
        var $ = layui.jquery
            ,layer = layui.layer //弹层
 
        
        $(document).on('click','#five1',function(){
                      layer.confirm('确定提交？', {
          btn: ['确定','取消'] //按钮
        }, function(){
        	$('#five1').submit();
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

    

  $('.layui-icon-delete').on('click', function(){
	  var role_id = $(this).attr('value');
		     layer.confirm('确认删除？', {
		  //按钮
		}, function(){
			$('.layui-body').load("sys/roleDelete?role_id="+role_id); 
		  layer.msg('删除成功', {icon: 1});
		}, function(){
		  layer.msg('取消', {
		    time: 20000, //20s后自动关闭
		    btn: ['明白了', '知道了']
		  });
});
    
    
  });
    
    

</script> 
	</div>

<script src="./layui/layui.all.js"></script>


</body>
</html>
