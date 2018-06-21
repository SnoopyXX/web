<%--
  Created by IntelliJ IDEA.
  User: stones
  Date: 2018/6/19
  Time: 10:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<div id="dlg">
<form id="ff" class="easyui-form" method="post" data-options="novalidate:true">
    <table cellpadding="5">
        <input type="hidden" name="id"/>
        <tr>
            <td>Name:</td>
            <td><input class="easyui-textbox" type="text" name="name" data-options="required:true"></input></td>
        </tr>
        <tr>
            <td>birthday:</td>
            <td><input class="easyui-datebox" type="text" name="birtday" data-options="formatter:myformatter,parser:parserDatebox"></input></td>
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
</div>
</body>
</html>
