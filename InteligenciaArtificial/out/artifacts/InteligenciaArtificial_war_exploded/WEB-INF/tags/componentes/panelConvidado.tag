<%@tag description="Caixa de texto com validação vazios" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%if (session.getAttribute("role") == null)%>
<jsp:doBody/>
