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
    pageContext.setAttribute("menu", new ia.menu.Menu(Intems.DEAMBULAR));
%>
<t:principal menu="${menu}">
    <jsp:attribute name="scripts">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script src="http://code.createjs.com/easeljs-0.6.1.min.js"></script>
        <script type="text/javascript" src="/js/deabular3.js"></script>
    </jsp:attribute>

    <jsp:body>
        <t:corpo titulo="Deambular 3"
                 sensor="O"
                 mostraT="true"
                 mostraOuro="false"/>
        <t:msgFinal>O agente termina aqui, pois todos os seus 4 sensores estão ocupados.</t:msgFinal>
    </jsp:body>
</t:principal>