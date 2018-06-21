<%@ page contentType="text/html;utf-8" language="java"%>
<html>
<body>
    <%--method:--%>
        <%--get：将参数和参数的值写在url上面；适应于数据量较小的场景；--%>
        <%--post：不会将提交的数据写在url上面；适应于数据量大的场景；--%>
                <%--比如上传照片、文档等；一般都可以post提交--%>
    <%--action:--%>
        <%--form表单提交的目的地；在这里是一个servlet的url访问地址--%>
    <form method="post" action="/student/index">
        <input type="text" name="name"/>
        <input type="text" name="password"/>
        <input type="submit" value="submit">
    </form>
</body>
</html>
