<%@ tag import="java.util.StringTokenizer" %>
<%@tag description="Caixa de texto com validação vazios" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@attribute name="roles" type="java.lang.String" required="true" %>
<%
    Integer userRole = (Integer) (session.getAttribute("role") == null ? 0 : session.getAttribute("role"));
    StringTokenizer st = new StringTokenizer(roles,",");
    while (st.hasMoreElements()) {
        String nt = st.nextToken();
        Integer stRole = Integer.parseInt(nt);
        if (userRole.equals(stRole)) {
%>
<jsp:doBody/>
<%
            break;
        }
    }
%>