<%@ tag import="tags.CamposCarregados" %>
<%@tag description="Caixa de texto com validação vazios" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@attribute name="label" required="true" %>
<%@attribute name="campo" required="true" %>
<%@attribute name="nomeCampo" required="true" %>
<%@attribute name="tipo" %>

<%
    String valorCampo = request.getParameter(campo);
    if(valorCampo==null && CamposCarregados.existeOCampo(campo))
        valorCampo = CamposCarregados.get().getCampos().get(campo);
%>

<div>
    <div><%=label%></div>
    <input name="<%=nomeCampo%>" class="input30EM" <%=valorCampo==null?"":"value='"+valorCampo+"'"%><%=tipo!=null?" type='"+tipo+"'":""%>/>
    <%if(valorCampo!=null && valorCampo.isEmpty()){%>
        <div class="erro">O campo <%=nomeCampo%> não pode ser vazio</div>
    <%}%>
</div>