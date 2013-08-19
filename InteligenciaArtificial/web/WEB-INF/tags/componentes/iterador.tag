<%@tag description="iterador" pageEncoding="utf-8" %>
<%@attribute name="it" type="tags.IteradorTag" required="true" %>
<%@attribute name="erro" fragment="true" %>
<%@attribute name="semRegistos" fragment="true" %>
<%
    boolean semReg = true;
    try {
    while (it.proximo()) {%>
<jsp:doBody/>
<%
    semReg = false;
    }
} catch (Exception ex) {
%>
<jsp:invoke fragment="erro"/>
<%}
if(semReg){%><jsp:invoke fragment="semRegistos"/><%}%>