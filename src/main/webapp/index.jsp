<%--
  Created by IntelliJ IDEA.
  User: stones
  Date: 2018/6/9
  Time: 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../statics/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../statics/easyui/themes/icon.css">
    <script type="text/javascript" src="../statics/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="../statics/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../statics/js/jquery.serializejson.js"></script>
</head>
<body class="easyui-layout">
    <div data-options="region:'north',border:false"
         style="height:60px; line-height:60px; overflow:hidden;background-color:rgb(0,129,194);padding-left: 10px;padding-right: 10px;">
        <!--<iframe src="top.jsp" width="100%" height="99%;" frameborder="0"> </iframe> -->
        <span style="color:white;font-size: 25px;">XX系统</span>
        <!-- 顶部状态栏-->
        <div style="float:right; text-align:right; color:white">
            <span id="sUser" style="color:white">欢迎【admin】访问系统</span>&nbsp;&nbsp;
            <a href="#" class="eayui-linkbutton" id="aUser" title="点此修改密码"><span style="color:white;">密码修改</span></a>&nbsp;&nbsp;&nbsp;
            <a href="javascript:void(0)" class="eayui-linkbutton" id="btnLogout"><span style="color:white;">退出系统</span></a>
        </div>
    </div>
    <div data-options = "region:'west',split:false,collapsible:true,title:'导航菜单'"
         style="width: 200px;padding: 1px;" id="dMenu">
        <div id="dMyMenu" class="easyui-accordion" style="width: 196px;">
            <div title="菜单名称" style="width: 196px;" class="nav_fl">
                <a href="#">
                    <li class="li_bian" id="student">
                        学生管理
                    </li>
                </a>
            </div>
        </div>
    </div>
    <div data-options="region:'south',border:false,height:30" style="padding:6px 0;text-align: center;color:white;background-color:rgb(0,129,194)">
        Copy Right &copy 2018 XXXX公司 版权所有 </div>
    <div data-options="region:'center'" style="z-index:-1;">
        <div class="easyui-tabs" id="tWork"
             data-options="fit:true,border:false,plain:true">
            <div title="首页">
                <iframe src="/jsp/home.jsp" width="100%" height="99%;" frameborder="0" wmode="window"> </iframe>
            </div>
        </div>
    </div>

    <div id="winpwd" class="easyui-window" title="修改密码"
         data-options="modal:true,closed:true,iconCls:'icon-save',collapsible:false,minimizable:false,maximizable:false"
         style="width:350px;height:250px;padding:20px;">
        <form id="formchangepwd" class="easyui-form" method="post"
              data-options="novalidate:true">
            <table>
                <tr>
                    <td>请输入原密码：</td>
                    <td><input class="easyui-textbox" style="height:30px;"
                               name="password" type="password" id="txtprepassword"
                               data-options="required:true,validType:'length[6,20]'"></input>
                    </td>
                </tr>
                <tr>
                    <td>请输入新密码：</td>
                    <td><input class="easyui-textbox" style="height:30px;"
                               name="password" type="password" id="txtnewpassword"
                               data-options="required:true,validType:'length[6,20]'"></input>
                    </td>
                </tr>
                <tr>
                    <td>请再次输入新密码：</td>
                    <td><input class="easyui-textbox" style="height:30px;"
                               name="password" type="password" id="txtconfirmpassword"
                               data-options="required:true,validType:'length[6,20]'"></input>
                    </td>
                </tr>
            </table>
            <div id="dFooter"
                 style="padding:10px;margin-bottom:10px;text-align:center;">
                <a href="#" class="easyui-linkbutton"
                   data-options="iconCls:'icon-save'" style="width:100px;height:40px;"
                   id="btnSavePwd">更新</a> <a href="#" class="easyui-linkbutton"
                                             data-options="iconCls:'icon-set'" style="width:100px;height:40px;"
                                             id="btnReset" type="reset">重置</a>
            </div>
        </form>
    </div>
</body>
<script type="text/javascript">
    function addTab(title, url) {
        if ($('#tWork').tabs('exists', title)) {
            $('#tWork').tabs('select', title);
        } else {
            var content = '<iframe scrolling="auto" frameborder="0"  src="'+ url + '" style="width:100%;height:98%;"></iframe>';

            $('#tWork').tabs('add', {
                title : title,
                content : content,
                closable : true,
                fit:true
            });
        }
    }
    $(document).on("click","#student",function() {
        addTab("学生管理", "<%=basePath%>student/index");
    });


    $("#btnLogout").click(function () {
        var flag=confirm("确定退出系统吗？");
        if (flag)
        {
            doData("user/logout",null,function () {
                location.href="login.jsp";
            });
        }
    });
</script>
</html>
