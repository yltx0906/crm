$(function(){
  $('.layui-nav-child').on({
    click:function(){
      if($(this).text()=="客户开发计划"){
        $('.layui-body').load('./sale/findChance');
       
      }
       if($(this).text()=="销售机会管理"){
        $('.layui-body').load('./sale/findallSale');
        
      }
       if($(this).text()=="客户信息查询"){
        $('.layui-body').load('./cust/findAllCustomers');
        
      }
      if($(this).text()=="客户信息添加"){
        $('.layui-body').load('./jsp/pages/Info_add.jsp');
       
      }
      if($(this).text()=="服务反馈"){
        $('.layui-body').load('./jsp/pages/Service_fankui.html');
        
      }
      if($(this).text()=="服务处理"){
        $('.layui-body').load('./jsp/pages/Service_chuli.html');
       
      }
      if($(this).text()=="客户贡献分析"){
        $('.layui-body').load('./jsp/pages/Report_gongxian.html');
       
      }
       if($(this).text()=="客户构成分析"){
        $('.layui-body').load('./jsp/pages/Report_goucheng.html');
        
      }
       if($(this).text()=="角色管理"){
        $('.layui-body').load('./sys/getAllUser');
        
      }
       if($(this).text()=="用户管理"){
        $('.layui-body').load('./sys/findAllMgr');
       
      }
      
    }
  },'dd');
});




