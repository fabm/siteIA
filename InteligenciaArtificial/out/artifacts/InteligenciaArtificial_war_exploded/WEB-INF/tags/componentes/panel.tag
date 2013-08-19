<%@tag description="Painel de renderização de acordo com estados" pageEncoding="UTF-8" %>
<%@attribute name="visivel" type="java.lang.Boolean" required="true" %>
<%if (visivel) {%><jsp:doBody/><%}%>