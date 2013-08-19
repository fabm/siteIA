<%--
  Created by IntelliJ IDEA.
  User: francisco
  Date: 20/07/13
  Time: 03:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%
    pageContext.setAttribute("menu", new ia.menu.Menu(ia.menu.Intems.PRINCIPAL));
%>
<t:principal menu="${menu}">

    <jsp:body>
        <t:post titulo="Apresentação">
            <p>
                Este site é a apresentação de uma página de internet com os exercícios de inteligência artificial.
            </p>
        </t:post>
    </jsp:body>
</t:principal>