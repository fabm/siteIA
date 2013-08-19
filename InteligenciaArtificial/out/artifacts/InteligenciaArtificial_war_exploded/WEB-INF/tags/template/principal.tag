<%@ tag import="java.util.Map" %>
<%@ tag import="ia.menu.Item" %>
<%@taglib prefix="c" tagdir="/WEB-INF/tags/template" %>
<%@tag description="Página principal" pageEncoding="UTF-8" %>
<%@attribute name="scripts" fragment="true" %>
<%@attribute name="menu" type="ia.menu.Menu" required="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--
Design by Free CSS Templates
http://www.freecsstemplates.org
Released for free under a Creative Commons Attribution 2.5 License

Name : Escalate
Description: A two-column, fixed-width design with dark color scheme.
Version : 1.0
Released : 20111121

-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <title>Inteligência artificial</title>
    <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600' rel='stylesheet'
          type='text/css'>
    <link href="style.css" rel="stylesheet" type="text/css" media="screen"/>
    <jsp:invoke fragment="scripts"/>
</head>
<body>
<div id="wrapper">
    <div id="header-wrapper">
        <div id="header">
            <div id="logo">
                <h1><a href="#">Inteligência artificial</a></h1>

                <p>Exercícios académicos</p>
            </div>
        </div>
    </div>
    <!-- end #header -->
    <div id="menu">
        <ul>
            <%for (Item i : menu.getItems()) {%>
            <li <%=i.isAtual()? " class='current_page_item'" : ""%> >
                <a href="<%=i.getLink()%>"><%=i.getLabel()%>
                </a></li>
            <%}%>
        </ul>
    </div>
    <!-- end #menu -->
    <div id="page">
        <div id="page-bgtop">
            <div id="page-bgbtm">
                <div id="content">
                    <jsp:doBody/>
                    <div style="clear: both;">&nbsp;</div>
                </div>
                <!-- end #content -->
                <div id="sidebar">
                    <c:barraDireita/>
                </div>
                <!-- end #sidebar -->
                <div style="clear: both;">&nbsp;</div>
            </div>
        </div>
    </div>
    <!-- end #page -->
</div>
<div id="footer">
    <p>Trabalho realizado por Francisco Monteiro</p>
</div>
<!-- end #footer -->
</body>
</html>