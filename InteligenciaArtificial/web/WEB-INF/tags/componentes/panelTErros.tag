<%@tag description="Painel de renderização tendo em conta se exitem erros ou não" pageEncoding="UTF-8" %>
<%@attribute name="tratamento" type="tags.TratamentoErros" required="true" %>
<%@attribute name="casoDeErro" fragment="true" required="true" %>
<%if(!tratamento.temErro()){%><jsp:doBody/><%}else{%><jsp:invoke fragment="casoDeErro"/><%}%>