(function(){function b(c,a){return c.type=a}var d="push",e="ArrowDown",f="ArrowLeft",g="ArrowRight",k="ArrowUp",l="ShiftLeft",m="ShiftRight",n="inputview-arrow-key ",p="inputview-down-key",q="inputview-left-key",r="inputview-right-key",s="inputview-shift-icon",t="inputview-up-key";function u(c,a,h,J){v.splice.apply(c,w(arguments,1))}function w(c,a,h){return 2>=arguments.length?v.slice.call(c,a):v.slice.call(c,a,h)}
function x(c){var a={toState:1,iconCssClass:s,type:5};a.id=c?l:m;a.supportSticky=!1;return y(a)}function z(c){var a={iconCssClass:n};0==c?(a.id=k,a.iconCssClass+=t,b(a,15)):1==c?(a.id=e,a.iconCssClass+=p,b(a,16)):2==c?(a.id=f,a.iconCssClass+=q,b(a,17)):3==c&&(a.id=g,a.iconCssClass+=r,b(a,18));return y(a)}function y(c){var a={},h;for(h in c)a[h]=c[h];return{spec:a}};var v=Array.prototype;for(var A=[["`","~","\u0300","\u0303"],["1","!","\u00b9","\u00a1"],["2","@","\u00b2","\u030b"],["3","#","\u00b3","\u0304"],["4","$","\u00a4","\u00a3"],["5","%","\u20ac","\u0327"],["6","^","\u0302","\u00bc"],["7","&","\u031b","\u00bd"],["8","*","\u0328","\u00be"],["9","(","\u2018","\u0306"],["0",")","\u2019","\u030a"],["-","_","\u00a5","\u0323"],["=","+","\u00d7","\u00f7"],["q","Q","\u00e4","\u00c4"],["w","W","\u00e5","\u00c5"],["e","E","\u00e9","\u00c9"],["r","R","\u00eb","\u00cb"],["t","T","\u00fe",
"\u00de"],["y","Y","\u00fc","\u00dc"],["u","U","\u00fa","\u00da"],["i","I","\u00ed","\u00cd"],["o","O","\u00f3","\u00d3"],["p","P","\u00f6","\u00d6"],["[","{","\u00ab","\u201c"],["]","}","\u00bb","\u201d"],["\\","|","\u00ac","\u00a6"],["a","A","\u00e1","\u00c1"],["s","S","\u00df","\u00a7"],["d","D","\u00f0","\u00d0"],["f","F"],["g","G"],["h","H"],["j","J","\u00ef","\u00cf"],["k","K","\u0153","\u0152"],["l","L","\u00f8","\u00d8"],[";",":","\u00b6","\u00b0"],["'",'"',"\u0301","\u0308"],["z","Z","\u00e6",
"\u00c6"],["x","X","\u0153","\u0152"],["c","C","\u00a9","\u00a2"],["v","V","\u00ae","\u00ae"],["b","B"],["n","N","\u00f1","\u00d1"],["m","M","\u00b5","\u00b5"],[",","<","\u00e7","\u00c7"],[".",">","\u0307","\u030c"],["/","?","\u00bf","\u0309"],[" "," "]],B=[],C={},D=[192,49,50,51,52,53,54,55,56,57,48,189,187,81,87,69,82,84,89,85,73,79,80,219,221,220,65,83,68,70,71,72,74,75,76,186,222,90,88,67,86,66,78,77,188,190,191,32],E="Backquote Digit1 Digit2 Digit3 Digit4 Digit5 Digit6 Digit7 Digit8 Digit9 Digit0 Minus Equal KeyQ KeyW KeyE KeyR KeyT KeyY KeyU KeyI KeyO KeyP BracketLeft BracketRight Backslash KeyA KeyS KeyD KeyF KeyG KeyH KeyJ KeyK KeyL Semicolon Quote KeyZ KeyX KeyC KeyV KeyB KeyN KeyM Comma Period Slash".split(" "),
F=0;F<A.length-1;F++){var G={};G.id=E[F];b(G,6);G.characters=A[F];G.keyCode=D[F];var H=y(G);B[d](H)}u(B,13,0,y({iconCssClass:"inputview-backspace-icon",type:13,id:"Backspace"}));u(B,14,0,y({iconCssClass:"inputview-tab-icon",type:14,id:"Tab"}));u(B,28,0,y({toState:4,name:"caps lock",type:5,id:"OsLeft"}));u(B,40,0,y({iconCssClass:"inputview-enter-icon",type:12,id:"Enter"}));u(B,41,0,x(!0));B[d](x(!1));B[d](y({iconCssClass:"inputview-globe-icon",type:27,id:"Globe"}));
B[d](y({iconCssClass:"inputview-menu-icon",toKeyset:void 0,type:26,id:"Menu"}));B[d](y({toState:8,name:"ctrl",type:5,id:"ControlLeft"}));B[d](y({toState:16,name:"alt",type:5,id:"AltLeft"}));B[d](y({name:" ",type:11,id:"Space"}));B[d](y({type:42,id:"enSwitcher"}));B[d](y({toState:2,name:"alt gr",type:5,id:"AltRight"}));B[d](z(2));B[d](z(3));B[d](y({iconCssClass:"inputview-hide-keyboard-icon",type:19,id:"HideKeyboard"}));for(F=0;F<B.length;F++)H=B[F],C[H.spec.id]="101kbd-k-"+F;var I=[];I.keyList=B;
I.mapping=C;I.layout="101kbd";I.hasAltGrKey=!0;I.hasCompactKeyboard=!1;I.showMenuKey=!0;I.id="us-altgr-intl";google.ime.chrome.inputview.onConfigLoaded(I);})();
