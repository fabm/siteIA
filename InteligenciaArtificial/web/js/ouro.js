$(document).ready(function () {
    init();
    $("#limpaSensores").click(function () {
        ts.limpaSensor();
    });
    $("#iniciar").click(function () {
        posRobot.x = 0;
        posRobot.y = 7;
        posRobot.calculaNovaPosicao();
        robot.x = posRobot.real.x;
        robot.y = posRobot.real.y;
        pontosMarcados.removeTodos();
        stage.update();
        $("#fim").slideUp();
        $("#proximo").prop("disabled", false);
        $("#play").prop("disabled", false);
        $("#play").text("play");
        atualizaLIs(-2);
    });
    $("#proximo").click(clickProximo);
    $("#play").click(function () {
        if ($(this).text() === "parar") {
            playOn = false
            $(this).text("play");
        } else if ($(this).text() === "play") {
            playOn = true;
            $(this).text("parar");
            clickProximo();
        }
    });
    $("#O1").click(function () {
        ts.setSensor(0);
        ts.desenhaSensor();
    });
    $("#O2").click(function () {
        ts.setSensor(1);
        ts.desenhaSensor();
    });
    $("#O3").click(function () {
        ts.setSensor(2);
        ts.desenhaSensor();
    });
    $("#O4").click(function () {
        ts.setSensor(3);
        ts.desenhaSensor();
    });
});

function descobrindo() {
    s = [];
    for (var i = 0; i < 4; i++) {
        ts.setSensor(i);
        s[i] = ts.sensorValido();
    }
    if (s[0])return dir.norte;
    if (s[1])return dir.este;
    if (s[2])return dir.sul;
    if (s[3])return dir.oeste;
    return -1;
}

var clickProximo = function () {
    if (!emMov) {
        if (!fproximo()) {
            playOn = false;
            $("#proximo").prop("disabled", true);
            $("#play").prop("disabled", true);
            $("#play").text("play");
            $("#fim").slideDown();
            atualizaLIs(-1);
        } else {
            $("#iniciar").prop("disabled", false);
        }
        ts.limpaSensor();
        createjs.Ticker.addEventListener("tick", tick);
        $("#anterior").prop("disabled", false);
    }
}
var playOn = false;
var emMov = false;
var posRobot = {
    real: {x: 0, y: 0},
    x: 0, y: 7,
    lp: [],//posições visitadas
    xReal: function () {
        return props.dh + this.x * props.espaco;
    },
    yReal: function () {
        return props.dv + this.y * props.espaco;
    },
    calculaNovaPosicao: function () {
        this.real.x = props.dh + (this.x + 0.5) * props.espaco;
        this.real.y = props.dv + (this.y + 0.5) * props.espaco;
    }
}
dir = {
    oeste: 0,
    norte: 1,
    este: 2,
    sul: 3
}

function atualizaLIs(i) {
    $("#listaDeambular > li").css('color', '');
    if(i==-2)return;
    if(i==-1){
        $("#deambular0").css('color', 'red');
        return;
    }
    var mapa = [];
    mapa[dir.norte] = 1;
    mapa[dir.este] = 2;
    mapa[dir.sul] = 3;
    mapa[dir.oeste] = 4;
    $("#deambular" + mapa[i]).css('color', 'red');
}
var props = {
    espaco: 60,
    dh: 60,//deslocamento horizontal
    dv: 60,//deslocamento vertical
    div: 9,//número de linhas divisoras
    lqp: [
        [3, 1],
        [4, 1],
        [5, 1],
        [3, 2],
        [1, 4],
        [1, 5],
        [4, 5],
        [6, 7]
    ]//lista de quadrados pintados
}

ouro = {x: 6, y: 1}

function fproximo() {
    var i = descobrindo();
    pontosMarcados.addiciona(posRobot.x, posRobot.y);
    if (i == dir.oeste) posRobot.x--;
    else if (i == dir.norte) posRobot.y--;
    else if (i == dir.este) posRobot.x++;
    else if (i == dir.sul) posRobot.y++;
    else return false;
    posRobot.calculaNovaPosicao();
    atualizaLIs(i);
    return true;
}

var canvas;
var stage;
var robot;

function init() {
    canvas = document.getElementById('canvas');
    canvas.width = 600;
    canvas.height = 600;

    stage = new createjs.Stage(canvas);


    var s = desenhaGrelha();

    props.x = 0;
    props.y = 7;


    robot = desenhaRobot();

    stage.addChild(s);
    stage.addChild(robot);
    createjs.Ticker.setFPS(30);
    stage.update();
}

function para() {
    createjs.Ticker.removeEventListener("tick", tick);
    emMov = false;
    if (playOn) {
        clickProximo();
    }
}

function tick(ev) {
    emMov = true;
    if (posRobot.real.x > robot.x)
        robot.x++;
    else if (posRobot.real.x < robot.x)
        robot.x--;
    else if (posRobot.real.y > robot.y)
        robot.y++;
    else if (posRobot.real.y < robot.y)
        robot.y--;
    else
        para();
    stage.update(ev);
}

function desenhaRobot(x, y) {
    var s = new createjs.Shape();
    var g = s.graphics;
    g.setStrokeStyle(1, 'round', 'round');
    g.beginStroke("#000");
    var r = (props.espaco / 2) - 10;
    me = props.espaco / 2;//metade do espaço
    g.drawCircle(0, 0, r);
    g.moveTo(0, -r);
    g.lineTo(0, -me);
    g.moveTo(0, r);
    g.lineTo(0, me);
    g.moveTo(-r, 0);
    g.lineTo(-me, 0);
    g.moveTo(r, 0);
    g.lineTo(me, 0);

    posRobot.calculaNovaPosicao();
    s.setTransform(posRobot.real.x, posRobot.real.y);
    return s;
}

function TesteSensores() {
    this._s = new createjs.Shape();
    this._g = this._s.graphics;
    this._sensor = 0;
    this._sb = false; // sensor bloqueado

    this._sensorBloqueado = function () {
        this.limpaSensor();
        this._sb = true;
    }

    this._pontoSensor = function () {
        if (this._sensor == 0)
            return {x: posRobot.x, y: posRobot.y - 1};
        else if (this._sensor == 1)
            return {x: posRobot.x + 1, y: posRobot.y };
        else if (this._sensor == 2)
            return {x: posRobot.x, y: posRobot.y + 1};
        else if (this._sensor == 3)
            return {x: posRobot.x - 1, y: posRobot.y};
    }

    this.setSensor = function (sensor) {
        this._sensor = sensor;
    }

    this.sensorValido = function () {
        ponto = this._pontoSensor();
        if (
            ponto.x < 0 ||
                ponto.x > 7 ||
                ponto.y < 0 ||
                ponto.y > 7 ||
                pontosMarcados.estaMarcado(ponto.x, ponto.y)
            )return false;


        for (var v = 0; v < props.lqp.length; v++) {
            if ((ponto.x == props.lqp[v][1] && ponto.y == props.lqp[v][0]))
                return false;
        }
        return true;
    }

    this.desenhaSensor = function () {
        if (this._sb) return;
        this.limpaSensor();
        this._g.beginFill(this.sensorValido() ? "#00FF00" : "#FF0000");

        m = [
            {x: 0, y: -1},
            {x: 1, y: 0},
            {x: 0, y: 1},
            {x: -1, y: 0}
        ];
        this._g.drawRect(
            props.dh + (posRobot.x + m[this._sensor].x) * props.espaco,
            props.dv + (posRobot.y + m[this._sensor].y) * props.espaco,
            props.espaco,
            props.espaco
        );
        this._g.endFill();
        stage.addChild(this._s);
        stage.update();
    }

    this.limpaSensor = function () {
        if (this._sb)return;
        this._g.clear();
        stage.removeChild(this._s);
        stage.update();
    }
}
ts = new TesteSensores();


pontosMarcados = {
    desenhos: [],
    coord: [],
    addiciona: function (x, y) {
        var pm = new createjs.Text("P", "20px Arial", "#ff7700");
        pm.x = props.dh + (x + 0.5) * props.espaco - 6;
        pm.y = props.dv + (y + 0.5) * props.espaco - 10;
        this.desenhos.push(pm);
        this.coord.push({'x': x, 'y': y});
        stage.addChild(pm);
    }, removeTodos: function () {
        for (var i = 0; i < this.desenhos.length; i++) {
            stage.removeChild(this.desenhos[i]);
        }
        this.coord = [];
        this.desenhos = [];
    }, estaMarcado: function (x, y) {
        for (var i = 0; i < this.coord.length; i++) {
            var a = this.coord[i];
            if (a.x == x && a.y == y) return true;
        }
        return false;
    }
};


function desenhaGrelha() {
    var s = new createjs.Shape();
    var g = s.graphics;

    g.setStrokeStyle(2, 'round', 'round');
    g.beginStroke("#000");
    //horizontal
    for (var i = 0; i < props.div; i++) {
        g.moveTo(i * props.espaco + props.dh, props.dv);
        g.lineTo(i * props.espaco + props.dh, (props.div - 1) * props.espaco + props.dv);
    }
    //vertical
    for (var i = 0; i < props.div; i++) {
        g.moveTo(props.dh, i * props.espaco + props.dv);
        g.lineTo((props.div - 1) * props.espaco + props.dh, i * props.espaco + props.dv);
    }

    for (var v = 0; v < props.lqp.length; v++) {
        g.beginFill("#000");
        g.drawRect(props.dh + props.lqp[v][1] * props.espaco, props.dv + props.lqp[v][0] * props.espaco,
            props.espaco, props.espaco
        );
        g.endFill();
    }
    return s;

}