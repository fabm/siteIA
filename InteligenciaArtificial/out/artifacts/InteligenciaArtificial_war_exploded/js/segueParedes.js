$(document).ready(function () {
    init();
    $("#limpaSensores").click(function () {
        ts.limpaSensor();
    });
    $("#iniciar").click(function(){
        posRobot.x=0;
        posRobot.y=7;
        posRobot.calculaNovaPosicao();
        robot.x = posRobot.real.x;
        robot.y = posRobot.real.y;
        stage.update();
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
    $("#X1").click(function () {
        ts.setSensor(0);
        ts.desenhaSensor();
    });
    $("#X2").click(function () {
        ts.setSensor(1);
        ts.desenhaSensor();
    });
    $("#X3").click(function () {
        ts.setSensor(2);
        ts.desenhaSensor();
    });
    $("#X4").click(function () {
        ts.setSensor(3);
        ts.desenhaSensor();
    });
});

function descobrindo(){
    s = [];
    for(var i=0;i<4;i++){
        ts.setSensor(i);
        s[i] = ts.sensorValido();
    }
    if(!s[3]&&s[0])return dir.norte;
    if(!s[0]&&s[1])return dir.este;
    if(!s[1]&&s[2])return dir.sul;
    if(!s[2]&&s[3])return dir.oeste;
}

var clickProximo = function () {
    if (!emMov) {
        if (!fproximo()) {
            playOn = false;
            $("#proximo").prop("disabled", true);
            $("#play").prop("disabled", true);
            $("#play").text("play");
        }else {
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
    var mapa = [];
    mapa[dir.norte] = 1;
    mapa[dir.este] = 2;
    mapa[dir.sul] = 3;
    mapa[dir.oeste] = 4;
        $("#deambular" + (mapa[i])).css('color', 'red');
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

function fproximo() {
    var i = descobrindo();
    if (i == dir.oeste) posRobot.x--;
    else if (i == dir.norte) posRobot.y--;
    else if (i == dir.este) posRobot.x++;
    else if (i == dir.sul) posRobot.y++;
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

    //obliquas
    var mp4 = Math.sin(Math.PI / 4) * r;
    g.moveTo(mp4, mp4);
    g.lineTo(me, me);
    g.moveTo(-mp4, mp4);
    g.lineTo(-me, me);
    g.moveTo(mp4, -mp4);
    g.lineTo(me, -me);
    g.moveTo(-mp4, -mp4);
    g.lineTo(-me, -me);

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

    this._pontosSensor = function () {
        if (this._sensor == 0) return [
            {x: posRobot.x, y: posRobot.y - 1},
            {x: posRobot.x + 1, y: posRobot.y - 1}
        ]; else if (this._sensor == 1) return [
            {x: posRobot.x + 1, y: posRobot.y},
            {x: posRobot.x + 1, y: posRobot.y + 1}
        ]; else if (this._sensor == 2) return [
            {x: posRobot.x, y: posRobot.y + 1},
            {x: posRobot.x - 1, y: posRobot.y + 1}
        ]; else if (this._sensor == 3) return [
            {x: posRobot.x - 1, y: posRobot.y},
            {x: posRobot.x - 1, y: posRobot.y - 1}
        ];
    }

    this.setSensor = function (sensor) {
        this._sensor = sensor;
    }

    this.sensorValido = function () {
        pontos = this._pontosSensor();
        if (
            pontos[0].x < 0 ||
                pontos[0].x > 7 ||
                pontos[0].y < 0 ||
                pontos[0].y > 7 ||
                pontos[1].x < 0 ||
                pontos[1].x > 7 ||
                pontos[1].y < 0 ||
                pontos[1].y > 7
            )return false;


        for (var v = 0; v < props.lqp.length; v++) {
            if (
                (pontos[0].x == props.lqp[v][1] && pontos[0].y == props.lqp[v][0]) ||
                    (pontos[1].x == props.lqp[v][1] && pontos[1].y == props.lqp[v][0])
                )return false;
        }
        return true;
    }

    this.desenhaSensor = function () {
        if (this._sb) return;
        this.limpaSensor();
        this._g.beginFill(this.sensorValido() ? "#00FF00" : "#FF0000");

        m = [
            {x: 0, y: -1, l: 2, a: 1},
            {x: 1, y: 0, l: 1, a: 2},
            {x: -1, y: 1, l: 2, a: 1},
            {x: -1, y: -1, l: 1, a: 2}
        ];
        this._g.drawRect(
            props.dh + (posRobot.x + m[this._sensor].x) * props.espaco,
            props.dv + (posRobot.y + m[this._sensor].y) * props.espaco,
            props.espaco * m[this._sensor].l,
            props.espaco * m[this._sensor].a
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