<%@taglib prefix="c" tagdir="/WEB-INF/tags/template" %>
<%@tag description="Página principal" pageEncoding="UTF-8" %>
<%@attribute name="titulo" required="true" %>

<div class="post">
    <h2 class="title"><a href="#">${titulo}</a></h2>
    <div class="entry">
        <jsp:doBody/>
    </div>
</div>