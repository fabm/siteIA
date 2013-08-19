<%@tag description="Página principal" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@taglib prefix="c" tagdir="/WEB-INF/tags/componentes" %>
<%@attribute name="titulo" required="true" %>
<%@attribute name="sensor" type="java.lang.Character" required="true" %>
<%@attribute name="mostraT" type="java.lang.Boolean" required="true" %>
<%@attribute name="mostraOuro" type="java.lang.Boolean" required="true" %>

<t:post titulo="${titulo}">
    <div style="float: left">
        <canvas id="canvas" style="width: 300px; height: 300px;"></canvas>
        <div style="text-align: center">
            <button id="iniciar" disabled="disabled">reeniciar</button>
            <button id="proximo">próximo</button>
            <button id="play">play</button>
        </div>
    </div>
    <div style="float: left">
        <ul id="listaDeambular" style="list-style-type: none;padding: 0px;">
            <c:panel visivel="${mostraOuro}">
                <li id="deambular0">¬Ouro → NIL</li>
            </c:panel>
            <c:panel visivel="${sensor=='O'}">
                <li id="deambular1">
                        <span><span>¬</span><span><span
                                style="display: inline-block; position: relative; width: 1.137em; height: 0px;"><span
                                style="position: absolute; top: -2.548em; left: 0.003em;"><span>O</span><span
                                style="display: inline-block; width: 0px; height: 2.554em;"></span></span><span
                                style="position: absolute; top: -1.868em; left: 0.74em;"><span
                                style="font-size: 70.7%; ">1</span><span
                                style="display: inline-block; width: 0px; height: 2.044em;"></span></span></span></span><span>,</span><span
                                style="padding-left: 0.173em;"><span><span>¬</span></span></span><span><span
                                style="display: inline-block; position: relative; width: 1.023em; height: 0px;"><span
                                style="position: absolute; top: -2.548em; left: 0.003em;"><span>P</span><span
                                style="display: inline-block; width: 0px; height: 2.554em;"></span></span><span
                                style="position: absolute; top: -1.868em; left: 0.626em;"><span
                                style="font-size: 70.7%; ">1</span><span
                                style="display: inline-block; width: 0px; height: 2.044em;"></span></span></span></span><span>→</span><span
                                style="">N
                            <span style="display: inline-block; overflow: hidden; height: 1px; width: 0.06em;"></span></span><span>,</span><span
                                style="padding-left: 0.173em;"><span
                                style="display: inline-block; position: relative; width: 1.363em; height: 0px;"><span
                                style="position: absolute; top: -2.548em; left: 0.003em;"><span style="">P</span><span
                                style="display: inline-block; width: 0px; height: 2.554em;"></span></span><span
                                style="position: absolute; top: -1.868em; left: 0.626em;"><span><span><span
                                style="font-size: 70.7%;">a</span><span style="font-size: 70.7%;">g</span></span></span><span
                                style="display: inline-block; width: 0px; height: 2.044em;"></span></span></span></span></span>
                </li>
                <li id="deambular2">
                        <span><span>¬</span><span><span
                                style="display: inline-block; position: relative; width: 1.137em; height: 0px;"><span
                                style="position: absolute; top: -2.548em; left: 0.003em;"><span>O</span><span
                                style="display: inline-block; width: 0px; height: 2.554em;"></span></span><span
                                style="position: absolute; top: -1.868em; left: 0.74em;"><span
                                style="font-size: 70.7%; ">2</span><span
                                style="display: inline-block; width: 0px; height: 2.044em;"></span></span></span></span><span>,</span><span
                                style="padding-left: 0.173em;"><span><span>¬</span></span></span><span><span
                                style="display: inline-block; position: relative; width: 1.023em; height: 0px;"><span
                                style="position: absolute; top: -2.548em; left: 0.003em;"><span>P</span><span
                                style="display: inline-block; width: 0px; height: 2.554em;"></span></span><span
                                style="position: absolute; top: -1.868em; left: 0.626em;"><span
                                style="font-size: 70.7%; ">2</span><span
                                style="display: inline-block; width: 0px; height: 2.044em;"></span></span></span></span><span>→</span><span
                                style="">E<span
                                style="display: inline-block; overflow: hidden; height: 1px; width: 0.06em;"></span></span><span>,</span><span
                                style="padding-left: 0.173em;"><span
                                style="display: inline-block; position: relative; width: 1.363em; height: 0px;"><span
                                style="position: absolute; top: -2.548em; left: 0.003em;"><span style="">P</span><span
                                style="display: inline-block; width: 0px; height: 2.554em;"></span></span><span
                                style="position: absolute; top: -1.868em; left: 0.626em;"><span><span><span
                                style="font-size: 70.7%;">a</span><span style="font-size: 70.7%;">g</span></span></span><span
                                style="display: inline-block; width: 0px; height: 2.044em;"></span></span></span></span></span>
                </li>
                <li id="deambular3">
                        <span><span>¬</span><span><span
                                style="display: inline-block; position: relative; width: 1.137em; height: 0px;"><span
                                style="position: absolute; top: -2.548em; left: 0.003em;"><span>O</span><span
                                style="display: inline-block; width: 0px; height: 2.554em;"></span></span><span
                                style="position: absolute; top: -1.868em; left: 0.74em;"><span
                                style="font-size: 70.7%; ">3</span><span
                                style="display: inline-block; width: 0px; height: 2.044em;"></span></span></span></span><span>,</span><span
                                style="padding-left: 0.173em;"><span><span>¬</span></span></span><span><span
                                style="display: inline-block; position: relative; width: 1.023em; height: 0px;"><span
                                style="position: absolute; top: -2.548em; left: 0.003em;"><span>P</span><span
                                style="display: inline-block; width: 0px; height: 2.554em;"></span></span><span
                                style="position: absolute; top: -1.868em; left: 0.626em;"><span
                                style="font-size: 70.7%; ">3</span><span
                                style="display: inline-block; width: 0px; height: 2.044em;"></span></span></span></span><span>→</span><span>S<span
                                style="display: inline-block; overflow: hidden; height: 1px; width: 0.06em;"></span></span><span>,</span><span
                                style="padding-left: 0.173em;"><span
                                style="display: inline-block; position: relative; width: 1.363em; height: 0px;"><span
                                style="position: absolute; top: -2.548em; left: 0.003em;"><span style="">P</span><span
                                style="display: inline-block; width: 0px; height: 2.554em;"></span></span><span
                                style="position: absolute; top: -1.868em; left: 0.626em;"><span><span><span
                                style="font-size: 70.7%;">a</span><span style="font-size: 70.7%;">g</span></span></span><span
                                style="display: inline-block; width: 0px; height: 2.044em;"></span></span></span></span></span>
                </li>
                <li id="deambular4">
                        <span><span>¬</span><span><span
                                style="display: inline-block; position: relative; width: 1.137em; height: 0px;"><span
                                style="position: absolute; top: -2.548em; left: 0.003em;"><span>O</span><span
                                style="display: inline-block; width: 0px; height: 2.554em;"></span></span><span
                                style="position: absolute; top: -1.868em; left: 0.74em;"><span
                                style="font-size: 70.7%; ">4</span><span
                                style="display: inline-block; width: 0px; height: 2.044em;"></span></span></span></span><span>,</span><span
                                style="padding-left: 0.173em;"><span><span>¬</span></span></span><span><span
                                style="display: inline-block; position: relative; width: 1.023em; height: 0px;"><span
                                style="position: absolute; top: -2.548em; left: 0.003em;"><span>P</span><span
                                style="display: inline-block; width: 0px; height: 2.554em;"></span></span><span
                                style="position: absolute; top: -1.868em; left: 0.626em;"><span
                                style="font-size: 70.7%; ">4</span><span
                                style="display: inline-block; width: 0px; height: 2.044em;"></span></span></span></span><span>→</span><span>O<span
                                style="display: inline-block; overflow: hidden; height: 1px; width: 0.06em;"></span></span><span>,</span><span
                                style="padding-left: 0.173em;"><span
                                style="display: inline-block; position: relative; width: 1.363em; height: 0px;"><span
                                style="position: absolute; top: -2.548em; left: 0.003em;"><span style="">P</span><span
                                style="display: inline-block; width: 0px; height: 2.554em;"></span></span><span
                                style="position: absolute; top: -1.868em; left: 0.626em;"><span><span><span
                                style="font-size: 70.7%;">a</span><span style="font-size: 70.7%;">g</span></span></span><span
                                style="display: inline-block; width: 0px; height: 2.044em;"></span></span></span></span></span>
                </li>
            </c:panel>
            <c:panel visivel="${sensor=='X'}">
                <li id="deambular1" style="">
                        <span><span><span
                                style="display: inline-block; position: relative; width: 1.137em; height: 0px;"><span
                                style="position: absolute; top: -2.548em; left: 0.003em;"><span>X</span><span
                                style="display: inline-block; width: 0px; height: 2.554em;"></span></span><span
                                style="position: absolute; top: -1.868em; left: 0.74em;"><span
                                style="font-size: 70.7%; ">4</span><span
                                style="display: inline-block; width: 0px; height: 2.044em;"></span></span></span></span><span>,</span><span
                                style="padding-left: 0.173em;"><span><span>¬</span></span></span><span><span
                                style="display: inline-block; position: relative; width: 1.023em; height: 0px;"><span
                                style="position: absolute; top: -2.548em; left: 0.003em;"><span>X</span><span
                                style="display: inline-block; width: 0px; height: 2.554em;"></span></span><span
                                style="position: absolute; top: -1.868em; left: 0.626em;"><span
                                style="font-size: 70.7%; ">1</span><span
                                style="display: inline-block; width: 0px; height: 2.044em;"></span></span></span></span><span>→</span><span>N</span></span>
                </li>
                <li id="deambular2" style="">
                        <span><span><span
                                style="display: inline-block; position: relative; width: 1.137em; height: 0px;"><span
                                style="position: absolute; top: -2.548em; left: 0.003em;"><span>X</span><span
                                style="display: inline-block; width: 0px; height: 2.554em;"></span></span><span
                                style="position: absolute; top: -1.868em; left: 0.74em;"><span
                                style="font-size: 70.7%; ">1</span><span
                                style="display: inline-block; width: 0px; height: 2.044em;"></span></span></span></span><span>,</span><span
                                style="padding-left: 0.173em;"><span><span>¬</span></span></span><span><span
                                style="display: inline-block; position: relative; width: 1.023em; height: 0px;"><span
                                style="position: absolute; top: -2.548em; left: 0.003em;"><span>X</span><span
                                style="display: inline-block; width: 0px; height: 2.554em;"></span></span><span
                                style="position: absolute; top: -1.868em; left: 0.626em;"><span
                                style="font-size: 70.7%; ">2</span><span
                                style="display: inline-block; width: 0px; height: 2.044em;"></span></span></span></span><span>→</span><span>E</span></span>
                </li>
                <li id="deambular3" style="">
                        <span><span><span
                                style="display: inline-block; position: relative; width: 1.137em; height: 0px;"><span
                                style="position: absolute; top: -2.548em; left: 0.003em;"><span>X</span><span
                                style="display: inline-block; width: 0px; height: 2.554em;"></span></span><span
                                style="position: absolute; top: -1.868em; left: 0.74em;"><span
                                style="font-size: 70.7%; ">2</span><span
                                style="display: inline-block; width: 0px; height: 2.044em;"></span></span></span></span><span>,</span><span
                                style="padding-left: 0.173em;"><span><span>¬</span></span></span><span><span
                                style="display: inline-block; position: relative; width: 1.023em; height: 0px;"><span
                                style="position: absolute; top: -2.548em; left: 0.003em;"><span>X</span><span
                                style="display: inline-block; width: 0px; height: 2.554em;"></span></span><span
                                style="position: absolute; top: -1.868em; left: 0.626em;"><span
                                style="font-size: 70.7%; ">3</span><span
                                style="display: inline-block; width: 0px; height: 2.044em;"></span></span></span></span><span>→</span><span>S</span></span>
                </li>
                <li id="deambular4" style="">
                        <span><span><span
                                style="display: inline-block; position: relative; width: 1.137em; height: 0px;"><span
                                style="position: absolute; top: -2.548em; left: 0.003em;"><span>X</span><span
                                style="display: inline-block; width: 0px; height: 2.554em;"></span></span><span
                                style="position: absolute; top: -1.868em; left: 0.74em;"><span
                                style="font-size: 70.7%; ">3</span><span
                                style="display: inline-block; width: 0px; height: 2.044em;"></span></span></span></span><span>,</span><span
                                style="padding-left: 0.173em;"><span><span>¬</span></span></span><span><span
                                style="display: inline-block; position: relative; width: 1.023em; height: 0px;"><span
                                style="position: absolute; top: -2.548em; left: 0.003em;"><span>X</span><span
                                style="display: inline-block; width: 0px; height: 2.554em;"></span></span><span
                                style="position: absolute; top: -1.868em; left: 0.626em;"><span
                                style="font-size: 70.7%; ">4</span><span
                                style="display: inline-block; width: 0px; height: 2.044em;"></span></span></span></span><span>→</span><span>O</span></span>
                </li>
            </c:panel>
            <c:panel visivel="${mostraT}">
                <li id="deambularT">¬T → NIL(não fazer nada)</li>
            </c:panel>
        </ul>

        <div style="float: left;display: block; text-align: center">
            <div>Teste dos sensores</div>
            <button id="${sensor}1">${sensor}1</button>
            <button id="${sensor}2">${sensor}2</button>
            <button id="${sensor}3">${sensor}3</button>
            <button id="${sensor}4">${sensor}4</button>
            <button id="limpaSensores">limpa sensores</button>
        </div>
    </div>
</t:post>