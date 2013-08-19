<%@ page import="ia.menu.Intems" %>
<%@ page import="ia.procura.procuraLargura.ResultadoIteracoes" %>
<%@ page import="ia.nos.LeitorHierarquico" %>
<%--
  Created by IntelliJ IDEA.
  User: francisco
  Date: 20/07/13
  Time: 03:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@taglib prefix="tc" tagdir="/WEB-INF/tags/template/procuraLargura" %>
<%

    pageContext.setAttribute("menu", new ia.menu.Menu(Intems.PROCURA));
    String ip = pageContext.getServletConfig().getInitParameter("pu");
    ResultadoIteracoes ri = new ResultadoIteracoes();
    LeitorHierarquico leitor = ri.leitor;

    //if(ip.equals("0"))
        pageContext.setAttribute("titulo","Procura em largura");
        pageContext.setAttribute("leitor",leitor);
%>
<t:principal menu="${menu}">
<jsp:attribute name="scripts">
<style>
    #procura ul {
        padding-left: 1em;
    }

    #procura li {
        list-style: disc;
        line-height: 1.2em;
    }

    .encontrado {
        color: orangered;
    }

    #resultado {
        font-size: 12px;
        overflow-y: scroll;
        width: 100%;
        height: 300px;
    }

    .titIteracao {
        margin-top: 2em;
    }

    #procura {
        font-size: 12px;
        overflow-y: scroll;
        width: 100%;
        height: 300px;
    }

    #solucao {
        font-size: 12px;
    }

    .scrollBox {
        height: 300px;
    }

    .scrollBox {
        width: 100%;
        border-style: dotted;
        border-color: lightsalmon;
        border-width: 2px;
    }

</style>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script>

</script>
    </jsp:attribute>
<jsp:body>
    <t:post titulo="${titulo}">
        Árvore
        <div id=procura class="scrollBox">
            <ul style="margin: 2em;">
                <tc:arvore leitor="${leitor}"/>
            </ul>
        </div>
        Iterações
        <div id="resultado" class="scrollBox">
        </div>
        <div>
            <button id="btIterar">iterar</button>
            <button id="btReeniciar">reeniciar</button>
        </div>
        Solução
        <div id="solucao">
        </div>
    </t:post>
</jsp:body>
</t:principal>