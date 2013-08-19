<%@ page import="ia.menu.Intems" %>
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
    pageContext.setAttribute("menu", new ia.menu.Menu(Intems.TLU));
%>
<t:principal menu="${menu}">
    <jsp:body>
        <t:post titulo="Threshold Linear Unit 1">
            <div style="text-align: center">
                <img src="/images/inicio.png">
                <img src="/images/f31.svg" alt="primeira página da imagem da tlu" style="width: 100%">
            </div>
        </t:post>
    </jsp:body>
</t:principal>