<%--
  Created by IntelliJ IDEA.
  User: stones
  Date: 2018/5/31
  Time: 09:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
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
</head>
<body>
<table id="dg" title="学生列表" class="easyui-datagrid" style="width:700px;height:400px"
       url="" toolbar="#toolbar" rownumbers="true"
        fitColumns="true" singleSelect="true">
    <thead>
        <tr>
            <th data-options="field:'id',checkbox:true"></th>
            <th field="firstname" width="50">姓名</th>
            <th field="lastname" width="50">sex</th>
            <th field="phone" width="50">age</th>
            <th field="email" width="50">password</th>
        </tr>
    </thead>
    <%--request.setAttribute("list",list);--%>
    <c:forEach var="list" items="${stulist}">
        <tr>
            <td>${list.id}</td>
            <td>${list.name}</td>
            <td>${list.birtday}</td>
            <td>${list.sex}</td>
            <td>${list.password}</td>
        </tr>
    </c:forEach>
</table>
<div id="toolbar">
    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newUser()">New User</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">Edit User</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyUser()">Remove User</a>
</div>
<div id="dlg" closed = "true" class="easyui-dialog" title="新增" data-options="iconCls:'icon-save'" style="width:500px;height:400px;padding:10px">
    <form id="ff" class="easyui-form" method="post" data-options="novalidate:true">
        <table cellpadding="5">
            <tr>
                <td>Name:</td>
                <td><input class="easyui-textbox" type="text" name="name" data-options="required:true"></input></td>
            </tr>
            <tr>
                <td>birthday:</td>
                <td><input class="easyui-datebox" type="text" name="birtday" data-options="formatter:myformatter,parser:myparser"></input></td>
            </tr>
            <tr>
                <td>sex:</td>
                <td><input class="easyui-textbox" type="text" name="sex" data-options="required:true"></input></td>
            </tr>
            <tr>
                <td>password:</td>
                <td><input class="easyui-textbox" name="password" data-options="required:true" style="height:60px"></input></td>
            </tr>
        </table>
    </form>
    <div id="bb">
        <a href="#" class="easyui-linkbutton" id="save">Save</a>
        <a href="#" class="easyui-linkbutton" id ="close" onclick="$('#dlg').dialog('close')">Close</a>
    </div>
</div>
</div>
</body>
<script>
    var isClick = "";
    function newUser() {
        isClick = "add";
        $("#ff").form("clear");
        $('#dlg').dialog('open');
        $("#save").click(function () {
            $.ajax({
                url:"/student?type=0",
                method:"get",
                data:$("#ff").serializeArray(),
                success:function (data) {
                    if(data == "success"){
                        alert("添加成功");
                        $("#dlg").dialog("close");
                    }
                }
            })
        })
    };

    function editUser() {
        isClick = "edit";
        var row = $('#dg').datagrid('getSelected');
        alert(row.id);
//        $("#save").text("Edit");
        $('#dlg').dialog('open');
        $.ajax({
            url:"/student?type=1",
            dataType:"json",
            method:"get",
            data:{id:row.id},
            success:function(data){
                $("#ff").form("load",data);
            }
        });
        $("#save").click(function () {
            $.ajax({
                url:"/student?type=3",
                method:"get",
                data:$("#ff").serializeArray(),
                success:function (data) {
                    if(data == "success"){
                        alert("更新成功");
                        $("#dlg").dialog("close");
                    }
                }
            })
        })
    }



    function destroyUser() {
        var row = $('#dg').datagrid('getSelected');
        $.messager.confirm('删除警告', '确定要删除这条数据吗？', function(r){
            if (r){
                $.ajax({
                    url:"/student?type=2",
                    method:"get",
                    data:{id:row.id},
                    success:function (data) {
                        $.messager.alert('','已删除!');
                    }
                })
            }
        });
    }

    function myformatter(date){
            var y = date.getFullYear();
            var m = date.getMonth()+1;
            var d = date.getDate();
            return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
    }
    function myparser(s){
        if (!s) return new Date();
        var ss = (s.split('-'));
        var y = parseInt(ss[0],10);
        var m = parseInt(ss[1],10);
        var d = parseInt(ss[2],10);
        if (!isNaN(y) && !isNaN(m) && !isNaN(d)){
            return new Date(y,m-1,d);
        } else {
            return new Date();
        }
    }
</script>
</html>
