<%@ page import="ia.menu.Intems" %>
<%@ page import="ia.procura.Cidade" %>
<%@ page import="ia.procura.procuraLargura.CidadePL" %>
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
    pageContext.setAttribute("menu", new ia.menu.Menu(Intems.TLU));
    pageContext.setAttribute("arad", CidadePL.criaArvoreProcuraCega());
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

        </style>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#procura li.nivel-1+ul").hide();
                $("#btIterar").click(function () {
                    mostraProximoNivel(iter);
                    iter++
                    $("#resultado").scrollTop(10000);
                });
                $("#btReeniciar").click(function () {
                    mostraProximoNivel(0);
                    iter = 1;
                    uEncontrado = -1;
                    $("#caminhoMaisProximo").empty();
                    $("#resultado").empty();
                    $("#btIterar").prop("disabled", false);
                    $("#solucao").hide();
                });
            });
            var iter = 1;
            var uEncontrado = -1;
            function mostraProximoNivel(i) {
                $("#procura li.nivel-" + (i + 1) + "+ul").slideUp();
                $("#procura li.nivel-" + i + "+ul").slideDown(function () {
                    $("#procura").scrollTop(10000);
                });
                var dcaminhos = "";
                var n = $("#procura li.nivel-" + (i + 1));
                n.each(function () {
                    var cc = [];
                    var a = $(this);
                    while (!a.hasClass("nivel-1")) {
                        cidades.push({cidade: a.data("cidade"), distancia: a.data("distancia")});
                        a = $(a).parent().prev();
                    }
                    cidades.push({cidade: "Arad", distancia: 0});

                    if (cidades.length != 0) {
                        var soma = 0;
                        var txt = "";
                        if (dcaminhos == "") {
                            for (var j = 0; j < cidades.length; j++) {
                                dcaminhos += "<th>" + "<div>Cidade</div><div>Distância</div>" + "</th>";
                            }
                            dcaminhos = "<tr>" + dcaminhos + "<th>Soma</th></tr>";
                        }
                        encontrou = false;
                        for (var ji = 0; ji < cidades.length; ji++) {
                            var j = cidades.length - ji - 1;
                            soma += cidades[j].distancia;
                            txt += ("<td><div>" + cidades[j].cidade + "</div>" +
                                    cidades[j].distancia + "</td>");
                            if (cidades[j].cidade == "Bucharest") {
                                encontrou |= true;
                            }
                        }
                        function strCaminhoMaisProximo() {
                            str = "";
                            for (var ji = 0; ji < cidades.length - 1; ji++) {
                                var j = cidades.length - ji - 1;
                                str += cidades[j].cidade + ",";
                            }
                            str += cidades[0].cidade;
                            str += " com um custo de " + soma;
                            return str;
                        }

                        if (encontrou) {
                            if (uEncontrado == -1) {
                                uEncontrado = soma;
                                $("#caminhoMaisProximo").text(strCaminhoMaisProximo());
                            } else if (uEncontrado > soma) {
                                uEncontrado = soma;
                                $(".encontrado").removeClass("encontrado");
                                $("#caminhoMaisProximo").text(strCaminhoMaisProximo());
                            } else {
                                encontrou = false;
                            }
                        }
                        dcaminhos += ("<tr" + (encontrou ? " class='encontrado'" : "") + ">" + txt + "<td>" + soma + "</td></tr>");
                    } else if (iter != 1) iter = -1;
                });
                if (n.length == 0) {
                    $("#btIterar").prop("disabled", true);
                    $("#solucao").show();
                }
                else {
                    $("#resultado").append("<div class='titIteracao'>Iteração " + iter + "</div>")
                    $("#resultado").append("<table class='iteracao'>" + dcaminhos + "</table>");
                }
            }
        </script>
    </jsp:attribute>
    <jsp:body>
        <t:post titulo="Procura em largura primeiro">
            <ul id="procura">
                <tc:arvore cidade="${arad}"/>
            </ul>
            <div id="resultado"></div>
            <div id="caminhoMaisProximo" style="margin-top: 2em"></div>
            <div id="solucao" style="display: none;margin-top: 2em">
                    A melhor solução é a do caminho Arad,Sibiu,Rimneu Vilcea,Pitesti,Bucharest com um custo de 418,
                    contudo
                    existe também a solução com o caminho Arad,Sibiu,Fagares,Bucharest com um custo de 450
            </div>
            <button id="btIterar">iterar</button>
            <button id="btReeniciar">reeniciar</button>
        </t:post>
    </jsp:body>
</t:principal>