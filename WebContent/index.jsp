<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="screen-orientation" content="portrait">
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0"/>
    <title>年会抽奖小程序</title>
    <link rel="stylesheet" type="text/css" href="css/reset.css">
    <link rel="stylesheet" type="text/css" href="css/wall.css">
    <style type="text/css">
        body, html {
            width: 100%;
            height: 100%;
        }
        .result {
            position: absolute;
            height: 320px;
            width: 100%;
            left: 0; top: 50%;
            margin-top: -160px;
            text-align: center;
            padding: 10px;
            display: none;
        }
        .result span {
            display: inline-block;
            font-size: 25px;
            width: 150px;
            background: #fff;
            line-height: 30px;
            color: #000;
            margin: 5px;
            border-radius: 10px;
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.8);
            padding: 10px 0;
        }
        button, input, optgroup, select, textarea {
            color: inherit;
            font: inherit;
            margin: 0;
            border: none;
        }
        button {
            overflow: visible;
        }
        button, select {
            text-transform: none;
        }
        button, html input[type=button], input[type=reset], input[type=submit] {
            -webkit-appearance: button;
            cursor: pointer;
        }
        .pure-button {
            display: inline-block;
            zoom: 1;
            line-height: normal;
            white-space: nowrap;
            vertical-align: middle;
            text-align: center;
            cursor: pointer;
            -webkit-user-drag: none;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        .pure-button {
            font-family: inherit;
            font-size: 100%;
            padding: .5em 1em;
            color: #444;
            color: rgba(0,0,0,.8);
            border: 0 rgba(0,0,0,0);
            background-color: #E6E6E6;
            text-decoration: none;
            border-radius: 2px;
        }
        .pure-button:focus {
            outline: 0
        }
        .pure-button-hover, .pure-button:hover, .pure-button:focus {
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#00000000', endColorstr='#1a000000', GradientType=0);
            background-image: -webkit-gradient(linear,0 0,0 100%,from(transparent),color-stop(40%,rgba(0,0,0,.05)),to(rgba(0,0,0,.1)));
            background-image: -webkit-linear-gradient(transparent,rgba(0,0,0,.05) 40%,rgba(0,0,0,.1));
            background-image: -moz-linear-gradient(top,rgba(0,0,0,.05) 0,rgba(0,0,0,.1));
            background-image: -o-linear-gradient(transparent,rgba(0,0,0,.05) 40%,rgba(0,0,0,.1));
            background-image: linear-gradient(transparent,rgba(0,0,0,.05) 40%,rgba(0,0,0,.1));
        }

        .button-success, .button-error, .button-warning, .button-secondary {
            color: white;
            border-radius: 4px;
            text-shadow: 0 1px 1px rgba(0, 0, 0, 0.2);
        }
        .button-success {
            background: rgb(28, 184, 65);
        }
        .button-error {
            background: rgb(202, 60, 60);
        }
        .button-warning {
            background: rgb(223, 117, 20);
        }
        .button-secondary {
            background: rgb(66, 184, 221);
        }
        .tools {
            position: absolute;
            bottom: 20px;
            right: 20px;
            text-align: center;
        }
        .tools .pure-button {
            display: inline-block;
            margin: 5px;
            padding: 10px 0;
            text-align: center;
            width:50px;
        }
        .mask {
            -webkit-filter:blur(5px);
            filter:blur(5px);
        }
        #main {
            -webkit-transition: all 1s;
            transition: all 1s;
        }
        .result-btn {
            margin-top: 20px;
            text-align: right;
            margin-right: 30px;
            text-decoration: none;
            color: white;
        }
    </style>
</head>
<body>
<div id="main" class="wall">
    <div class="result-btn">
       <a href="./result.html" target="_blank">获奖名单</a>
       <a href="/lottery/login">抽奖管理</a>
    </div>
</div>
<div id="result" class="result">
</div>
<div id="tools" class="tools">
     <button
        v-for="value in btns"
        @click="onClick(value)"
        class="pure-button"
        :class="{ 'button-error': selected == value}"
       >{{value}}</button>
    <button
       class="pure-button"
       @click="toggle"
       :class="{'button-secondary': !running,
               'button-success': running}">{{running?'停!':'开始'}}</button>
    <button class="pure-button button-warning" @click="reset">重置</button>
</div>
<script type="text/javascript" src="js/zepto.js"></script>
<script type="text/javascript" src="js/vue.js"></script>
<script type="text/javascript" src="js/tagcanvas.js"></script>
<script type="text/javascript" src="js/member.js"></script>
<script type="text/javascript">
    (function(){
        var choosed = JSON.parse(localStorage.getItem('choosed')) || {};
        console.log(choosed);
        var speed = function(){
            return [0.1 * Math.random() + 0.01, -(0.1 * Math.random() + 0.01)];
        };
        var getKey = function(item){
            return item.name + '-' + item.phone;
        };
        var createHTML = function(){
            var html = [ '<ul>' ];
            member.forEach(function(item, index){
                item.index = index;
                var key = getKey(item);
                var color = choosed[key] ? 'yellow' : 'white';
                html.push('<li><a href="#" style="color: ' + color + ';">' + item.name + '</a></li>');
            });
            html.push('</ul>');
            return html.join('');
        };
        var lottery = function(count){
            var list = canvas.getElementsByTagName('a');
            var color = 'yellow';
            var ret = member
                .filter(function(m, index){
                    m.index = index;
                    return !choosed[getKey(m)];
                })
                .map(function(m){
                    return Object.assign({
                      score: Math.random()
                    }, m);
                })
                .sort(function(a, b){
                    return a.score - b.score;
                })
                .slice(0, count)
                .map(function(m){
                  choosed[getKey(m)] = 1;
                  list[m.index].style.color = color;
                  return m.name + '<br/>' + m.phone; 
                });
            localStorage.setItem('choosed', JSON.stringify(choosed));
            return ret;
        };
        var canvas = document.createElement('canvas');
        canvas.id = 'myCanvas';
        canvas.width = document.body.offsetWidth;
        canvas.height = document.body.offsetHeight;
        document.getElementById('main').appendChild(canvas);
        new Vue({
            el: '#tools',
            data: {
                selected: 30,
                running: false,
                btns: [
                    30, 10, 5, 2, 1
                ]
            },
            mounted () {
                canvas.innerHTML = createHTML();
                TagCanvas.Start('myCanvas', '', {
                    textColour: null,
                    initial: speed(),
                    dragControl: 1,
                    textHeight: 14
                });
            },
            methods: {
                reset: function(){
                    if(confirm('确定要重置么？所有之前的抽奖历史将被清除！')){
                        localStorage.clear();
                        location.reload(true);
                    }
                },
                onClick: function(num){
                    $('#result').css('display', 'none');
                    $('#main').removeClass('mask');
                    this.selected = num;
                },
                toggle: function(){
                    if(this.running){
                        TagCanvas.SetSpeed('myCanvas', speed());
                        var ret = lottery(this.selected);
                        if (ret.length === 0) {
                            $('#result').css('display', 'block').html('<span>已抽完</span>');
                            return
                        }
                        $('#result').css('display', 'block').html('<span>' + ret.join('</span><span>') + '</span>');
                        TagCanvas.Reload('myCanvas');
                        setTimeout(function(){
                            localStorage.setItem(new Date().toString(), JSON.stringify(ret));
                            $('#main').addClass('mask');
                        }, 300);
                    } else {
                        $('#result').css('display', 'none');
                        $('#main').removeClass('mask');
                        TagCanvas.SetSpeed('myCanvas', [5, 1]);
                    }
                    this.running = !this.running;
                }
            }
        });
    })();
</script>
</body>
</html>
