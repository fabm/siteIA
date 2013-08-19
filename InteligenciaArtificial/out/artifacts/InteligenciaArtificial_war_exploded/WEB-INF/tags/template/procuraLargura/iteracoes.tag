<%@ tag import="ia.nos.LeitorHierarquico" %>
<%@ tag import="ia.nos.No" %>
<%@ tag import="ia.procura.procuraLargura.CidadePL" %>
<%@taglib prefix="c" tagdir="/WEB-INF/tags/template" %>
<%@tag description="Página principal" pageEncoding="UTF-8" %>
<%@attribute name="cidade" required="true" type="ia.procura.procuraLargura.CidadePL" %>
<%
    LeitorHierarquico<CidadePL> leitor = new LeitorHierarquico<CidadePL>(cidade);
    while (!leitor.isFimIterador()) {
        No<CidadePL> no = leitor.proximo();
        if (leitor.isInicioNo()) {
%>
<li class="iteracao<%=no.getElemento().getIteracao()%>"><%=no.getElemento().getNome()%>(<%=no.getElemento().getDistancia()%>)<%
    if (leitor.isInicioNoSemFilhos()) {// se não tiver filhos fecha imediatamente
%></li>
<%}
}if (leitor.isInicioNoComFilhos()) {%></li><ul><%}if (leitor.isFimNo()) {%></ul><%}}%>
