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
    <div style="padding:20px;">
    <form  id="addCustomer"  action="cust/add"  method="post">

  <div class="layui-form-item">
   <label class="layui-form-label">客户名称</label>
    <div class="layui-input-block">
      <input type="text" name="cust_name" style="width:1000px"   placeholder="请输入客户名称" autocomplete="off" class="layui-input">
    </div>
     <label class="layui-form-label">客户经理</label>
    <div class="layui-input-block">
      <input type="text" name="cust_manager_name" style="width:1000px"  placeholder="请输入名称" autocomplete="off" class="layui-input">
    </div>
   <label class="layui-form-label">客户地址</label>
    <div class="layui-input-block">
      <input type="text" name="cust_addr" style="width:1000px"  placeholder="请输入客户地址" autocomplete="off" class="layui-input">
    </div>
   <label class="layui-form-label">邮政编码</label>
    <div class="layui-input-block">
      <input type="text" name="cust_zip" style="width:1000px"  placeholder="请输入邮政编码" autocomplete="off" class="layui-input">
    </div>
   <label class="layui-form-label">客户电话</label>
    <div class="layui-input-block">
      <input type="text" name="cust_tel" style="width:1000px"  placeholder="请输入客户电话" autocomplete="off" class="layui-input">
    </div>
   <label class="layui-form-label">客户传真</label>
    <div class="layui-input-block">
      <input type="text" name="cust_fax" style="width:1000px"  placeholder="请输入客户传真" autocomplete="off" class="layui-input">
    </div>
   <label class="layui-form-label">客户网址</label>
    <div class="layui-input-block">
      <input type="text" name="cust_website" style="width:1000px"  placeholder="请输入客户网址" autocomplete="off" class="layui-input">
    </div>
    <label class="layui-form-label">营业执照</label>
    <div class="layui-input-block">
      <input type="text" name="cust_licence_no" style="width:1000px"  placeholder="请输入注册号" autocomplete="off" class="layui-input">
    </div>

    <label class="layui-form-label">法人</label>
    <div class="layui-input-block">
      <input type="text" name="cust_chieftain" style="width:1000px"  placeholder="请输入名称" autocomplete="off" class="layui-input">
    </div>
    <label class="layui-form-label">注册资金</label>
    <div class="layui-input-block">
      <input type="text" name="cust_bankroll" style="width:1000px"  placeholder="请输入资金数额" autocomplete="off" class="layui-input">
    </div>
    <label class="layui-form-label">年营业额</label>
    <div class="layui-input-block">
      <input type="text" name="cust_turnover" style="width:1000px"  placeholder="请输入年营业额" autocomplete="off" class="layui-input">
    </div>
    <label class="layui-form-label">开户银行</label>
    <div class="layui-input-block">
      <input type="text" name="cust_bank" style="width:1000px"  placeholder="请输入银行名称" autocomplete="off" class="layui-input">
    </div>
    <label class="layui-form-label">银行账号</label>
    <div class="layui-input-block">
      <input type="text" name="cust_bank_account" style="width:1000px"  placeholder="请输入账号" autocomplete="off" class="layui-input">
    </div>
    <label class="layui-form-label">地税登记号</label>
    <div class="layui-input-block">
      <input type="text" name="cust_local_tax_no" style="width:1000px"  placeholder="请输入登记号" autocomplete="off" class="layui-input">
    </div>
 <label class="layui-form-label">国税登记号</label>
    <div class="layui-input-block">
      <input type="text" name="cust_national_tax_no" style="width:1000px"  placeholder="请输入商机概要" autocomplete="off" class="layui-input">
    </div>
 
  </div>
  
  



    
  
   <div class="layui-form-item">
        <label class="layui-form-label">地区</label>
        
          <select style="width:90%;height:30px;" name="cust_region" lay-verify="required">
            <option value="">请选择</option>
            <option value="华中">华中</option>
            <option value="华北">华北</option>
            <option value="华南">华南</option>
            <option value="华东">华东</option>
            
          </select>
        
      </div>
      <div class="layui-form-item">
        <label class="layui-form-label">客户等级</label>
        
          <select style="width:90%;height:30px;" name="cust_level_label" lay-verify="required">
            <option value="">请选择</option>
            <option value="普通客户">普通客户</option>
            <option value="重点开发客户">重点开发客户</option>
            <option value="大客户">大客户</option>
            <option value="合作伙伴">合作伙伴</option>
            <option value="战略合作伙伴">战略合作伙伴</option>
            
          </select>
        
      </div>
     






       <div class="layui-input-block">
     <button  id="twn" class="layui-btn layui-btn-fluid">立即提交</button>
      
    </div>
	</form>


      </div>


      <script src="./layui/layui.all.js"></script>
    
    




</body>
</html>
<script>
 $(function(){



  $('.layui-input-block').on({
    click:function(){
    	$('.layui-body').load('./pages/find.html');
    }
  },'button');


}); 
$('#twn').on({
  click:function(){
      $('#addCustomer').submit();                                                      
    layer.msg('提交成功');
  }
})



</script>
