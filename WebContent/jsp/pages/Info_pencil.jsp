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
  <link rel="stylesheet" href="layui/css/layui.css">
</head>
<body>
  <div class="list">
  <span class="layui-breadcrumb" style="margin-left:20px;margin-top:30px">
  <a href="">首页</a>
  <a href="">列表页</a>
  <a href="">联系人</a>
  
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
      <th>姓名</th>
      <th>性别</th>
      <th>职位</th>
      <th>办公室电话</th>
      <th>手机</th>

   
    <th>备注</th>
    <th >操作</th>


    </tr> 
  </thead>
  <tbody>
  <c:forEach items="${linkmans}" var="linkman"  >
    <tr>
      <td>${linkman.lkm_name}</td>
      <td>${linkman.lkm_sex}</td>
      <td>${linkman.lkm_postion}</td>
      <td>${linkman.lkm_tel}</td>
      <td>${linkman.lkm_mobile}</td>
     
      <td>${linkman.lkm_memo}</td>
      <td class="test">
        <i  class="layui-icon layui-icon-note" title="新建" style="font-size: 20px; color: #1E9FFF;padding:15px"></i> 
        <i id="first" value="${linkman.lkm_id}" class="layui-icon layui-icon-file-b" title="修改" style="font-size: 20px; color: #1E9FFF;padding:15px"></i>  
        <i value="${linkman.lkm_id}" class="layui-icon layui-icon-delete" title="删除" style="font-size: 20px; color: #1E9FFF;padding:15px"></i>
       
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
  <script src="layui/layui.all.js"></script>
</body>
</html>
<script>
  
layui.use('laypage', function(){
  var laypage = layui.laypage;
  
  //执行一个laypage实例
  laypage.render({
    elem: 'test1' //注意，这里的 test1 是 ID，不用加 # 号
    ,count: 50 //数据总数，从服务端得到
  });
});
  $(function(){
  $('.layui-input-block').on({
    click:function(){
      $('.layui-body').load(pages/Info_find.html);
       
    }
  },'button');
});
  $('.layui-icon-note').on('click', function(){
    layer.open({
      type: 1,
      title:'新建联系人',
      area: ['600px', '200px'],
      shadeClose: true, //点击遮罩关闭
      content: `<form id="addForm1" action="cust/addLinkman" method="post" >
      <div class="layui-form-item">
    <input id="hidden4" type="hidden" name="lkm_cust_id" value="${cust_id}" >
    <label class="layui-form-label">姓名</label>
    <div class="layui-input-block">
      <input type="text" name="lkm_name" required  lay-verify="required" placeholder="请输入联系人姓名" autocomplete="off" class="layui-input">
    </div>
    <label class="layui-form-label">性别</label>
    <div class="layui-input-block">
      <input type="text" name="lkm_sex" required  lay-verify="required" placeholder="请输入性别" autocomplete="off" class="layui-input">
    </div>
    <label class="layui-form-label">职位</label>
    <div class="layui-input-block">
      <input type="text" name="lkm_postion" required  lay-verify="required" placeholder="请输入职位" autocomplete="off" class="layui-input">
    </div>
    <label class="layui-form-label">电话</label>
    <div class="layui-input-block">
      <input type="text" name="lkm_tel" required  lay-verify="required" placeholder="请输入办公电话" autocomplete="off" class="layui-input">
    </div>
    <label class="layui-form-label">手机</label>
    <div class="layui-input-block">
      <input type="text" name="lkm_mobile" required  lay-verify="required" placeholder="请输入手机号" autocomplete="off" class="layui-input">
    </div>
    <label class="layui-form-label">备注</label>
    <div class="layui-input-block">
      <input type="text" name="lkm_memo" required  lay-verify="required" placeholder="请输入备注" autocomplete="off" class="layui-input">
    </div>
  </div>
  
  
    <div class="layui-input-block">
      <button id="btn2" class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
    </div>
    
  </div>
  </form>`
        });
    
  //新建 
    $('#btn2').on('click', function(){
             
               layer.confirm('确认提交？', {
           
          }, function(){
          	$('#addForm1').submit();
            layer.msg('提交成功', {icon: 1});
          }, function(){
            layer.msg('也可以这样', {
              time: 20000, //20s后自动关闭
              btn: ['明白了', '知道了']
            });
          });
              
              
            });

  });



  $('.layui-icon-file-b').on('click', function(){
		var lkm_id = $(this).attr('value');
		
    layer.open({
      type: 1,
      title:'编辑联系人',
      area: ['600px', '200px'],
      shadeClose: true, //点击遮罩关闭
      content:`<form id="editForm1" action="cust/updateLinkman" method="post" >
      <div class="layui-form-item">
      <input id="hidden3" type="hidden" name="lkm_id" value="" >
      <label class="layui-form-label">姓名</label>
      <div class="layui-input-block">
        <input type="text" name="lkm_name" required  lay-verify="required" placeholder="请输入联系人姓名" autocomplete="off" class="layui-input">
      </div>
      <label class="layui-form-label">性别</label>
      <div class="layui-input-block">
        <input type="text" name="lkm_sex" required  lay-verify="required" placeholder="请输入性别" autocomplete="off" class="layui-input">
      </div>
      <label class="layui-form-label">职位</label>
      <div class="layui-input-block">
        <input type="text" name="lkm_postion" required  lay-verify="required" placeholder="请输入职位" autocomplete="off" class="layui-input">
      </div>
      <label class="layui-form-label">电话</label>
      <div class="layui-input-block">
        <input type="text" name="lkm_tel" required  lay-verify="required" placeholder="请输入办公电话" autocomplete="off" class="layui-input">
      </div>
      <label class="layui-form-label">手机</label>
      <div class="layui-input-block">
        <input type="text" name="lkm_mobile" required  lay-verify="required" placeholder="请输入手机号" autocomplete="off" class="layui-input">
      </div>
      <label class="layui-form-label">备注</label>
      <div class="layui-input-block">
        <input type="text" name="lkm_memo" required  lay-verify="required" placeholder="请输入备注" autocomplete="off" class="layui-input">
      </div>
    </div>
    
    
      <div class="layui-input-block">
        <button id="btn1" class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
      </div>
      
    </div>
    </form>`
  
    });
    $('#hidden3').attr('value',lkm_id); 
    //编辑
    $('#btn1').on('click', function(){
             
               layer.confirm('确认提交？', {
           
          }, function(){
          
          	
          	var a = $('#hidden3').attr('value');
          	console.log(a);
          	$('#editForm1').submit();
            layer.msg('提交成功', {icon: 1});
          }, function(){
            layer.msg('也可以这样', {
              time: 20000, //20s后自动关闭
              btn: ['明白了', '知道了']
            });
          });
              
            });
  });


        $(document).on('click','#eight',function(){
                      layer.confirm('确定提交？', {
          btn: ['确定','取消'] //按钮
        }, function(){
          layer.msg('提交成功，点击关闭按钮关闭', {icon: 1});
        }, function(){
          layer.msg('重新提交', {
            time: 20000, //20s后自动关闭
            btn: ['明白了']
          });
        });
            
        });



//删除
  $('.layui-icon-delete').on('click', function(){
	  var lkm_id = $(this).attr('value');
             layer.confirm('确认删除？', {
         
        }, function(){
        	 $('.layui-body').load("cust/deleteLinkman?lkm_id="+lkm_id);
          layer.msg('删除成功', {icon: 1});
        }, function(){
          layer.msg('也可以这样', {
            time: 20000, //20s后自动关闭
            btn: ['明白了', '知道了']
          });
        });
            
            
          });
  
   
   


</script>







