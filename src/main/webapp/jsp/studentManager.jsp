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
    <script type="text/javascript" src="../statics/js/jquery.serializejson.js"></script>
    <script type="text/javascript" src="../statics/js/utils.js"></script>
</head>
<body>
<table id="dg" title="学生列表" class="easyui-datagrid" style="width:auto;height:550px;"
       toolbar="#toolbar" rownumbers="true" pagination="true" fitColumns="true" singleSelect="true"
       selectOnCheck="false" checkOnSelect="true">
    <thead>
    <th data-options="field:'id',width:80,checkbox:true"></th>
    <th data-options="field:'name',width:100">姓名</th>
    <th data-options="field:'birthday',width:100,formatter:formatDatebox">生日</th>
    <th data-options="field:'sex',width:80,align:'right'">姓名</th>
    <th data-options="field:'password',width:80,align:'right'">密码</th>
    </thead>
    <%--request.setAttribute("list",list);--%>
    <%--<c:forEach var="list" items="${stulist}">--%>
        <%--<tr>--%>
            <%--<td>${list.id}</td>--%>
            <%--<td>${list.name}</td>--%>
            <%--<td>${list.birtday}</td>--%>
            <%--<td>${list.sex}</td>--%>
            <%--<td>${list.password}</td>--%>
        <%--</tr>--%>
    <%--</c:forEach>--%>
</table>
<div id="toolbar">
    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newUser()">新增</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">修改</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyUser()">删除</a>
    <input type="text"  style="width: 300px; height: 28px;" name="name" id="txtName" required
           placeholder="请输入学生姓名" autocomplete="off"/>
        <a href="#" class="easyui-linkbutton" id="btnFind">搜索</a>
    </div>
</div>
    <div id="dlg1">
        <%--<a href="#" class="easyui-linkbutton" id="save">提交</a>--%>
        <%--<a href="#" class="easyui-linkbutton" id ="close" onclick="$('#dlg').dialog('close')">关闭</a>--%>
    </div>
</div>
</div>
</body>
<script>

    function getCondition() {
        var obj = new Object();
        obj.name = $("#txtName").val();
        return obj;
    }

    function find() {
        findByPage("query","dg",getCondition(),function (){})
    }

    $(function () {
        find();
        $("#btnFind").click(function(){
            find();
        });
    })

    function add() {
//        alert(JSON.stringify($("#ff").serializeJSON()));
        var obj = JSON.stringify($("#ff").serializeJSON());
        alert(obj);
        $.ajax({
            url:"/student/add",
            method:"post",
            data:obj,
            dataType:"text",
            contentType:"application/json",
            success:function (data) {
                if(data == "success"){
                    find();
                    $.messager.show({title:"提示",msg:"【"+obj.name + "】新增成功"})
//                    $("#dlg").dialog("close");
                }else{
                    find();
                    $.messager.alert('警告','操作失败!','error');
                }
            }
        })
    }

    function newUser() {
        $("#ff").form("clear");
        $('#dlg1').dialog({
            id : 'newDialog',
            title : 'My Dialog',
            width : 600,
            height : 400,
            closed : false,
            cache : false,
            href : '<%=basePath%>student/form',
            modal : true,
            onClose : function() {
                $(this).dialog('destroy');
            },
            buttons : [ {
                text : 'OK',
                iconCls : 'icon-ok',
                handler : function() {
//                    alert("1");
                    add();
                }
            }, {
                text : 'CANCEL',
                iconCls : 'icon-cancel',
                handler : function() {
                    $("#dlg1").dialog('close');
//                    $("#dlg").dialog('destroy');
                }
            } ]
        });
//        $("#save").click(function () {
//            alert(JSON.stringify($("#ff").serializeJSON()));
//            $.ajax({
//                url:"/student/add",
//                method:"post",
//                data:JSON.stringify($("#ff").serializeJSON()),
//                dataType:"text",
//                contentType:"application/json",
//                success:function (data) {
//                    if(data == "success"){
//                        find();
//                        $.messager.show({title:"提示",msg:"【"+row.name + "】新增成功"})
//                        $("#dlg").dialog("close");
//                    }else{
//                        find();
//                        $.messager.alert('警告','操作失败!','error');
//                    }
//                }
//            })
//        })
    };

    function editUser() {
        var row = $('#dg').datagrid('getSelected');
        $('#dlg').dialog('open');
        $.ajax({
            url:"/student/edit",
            dataType:"json",
            method:"post",
            data:{id:row.id},
            success:function(data){
                $("#ff").form("load",data);
            }
        });
        $("#save").click(function () {
            $.ajax({
                url:"/student/doEdit",
                method:"post",
                data:JSON.stringify($("#ff").serializeJSON()),
                contentType:"application/json",
                dataType:"text",
                success:function (data) {
                    if(data == "success"){
                        find();
                        $.messager.show({title:"提示",msg:"【"+row.name + "】更新成功"})
                        $("#dlg").dialog("close");
                    }else{
                        find();
                        $.messager.alert('警告','操作失败!','error');
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
                    url:"/student/del",
                    method:"post",
                    data:{id:row.id},
                    success:function (data) {
                        if(data == "success"){
                            find();
                            $.messager.show({title:"提示",msg:"【"+row.name + "】已被删除"});
                        }else{
                            $.messager.alert('警告','操作失败!','error');
                        }
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
