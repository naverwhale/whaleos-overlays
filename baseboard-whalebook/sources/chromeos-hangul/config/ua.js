(function(){function b(c,a){return c.type=a}var d="push",e="ArrowDown",f="ArrowLeft",g="ArrowRight",k="ArrowUp",l="ShiftLeft",m="ShiftRight",n="inputview-arrow-key ",p="inputview-down-key",q="inputview-left-key",r="inputview-right-key",s="inputview-shift-icon",t="inputview-up-key";function u(c,a,h,J){v.splice.apply(c,w(arguments,1))}function w(c,a,h){return 2>=arguments.length?v.slice.call(c,a):v.slice.call(c,a,h)}
function x(c){var a={toState:1,iconCssClass:s,type:5};a.id=c?l:m;a.supportSticky=!1;return y(a)}function z(c){var a={iconCssClass:n};0==c?(a.id=k,a.iconCssClass+=t,b(a,15)):1==c?(a.id=e,a.iconCssClass+=p,b(a,16)):2==c?(a.id=f,a.iconCssClass+=q,b(a,17)):3==c&&(a.id=g,a.iconCssClass+=r,b(a,18));return y(a)}function y(c){var a={},h;for(h in c)a[h]=c[h];return{spec:a}};var v=Array.prototype;for(var A=[["\u2019","'","\u0301","~"],["1","!"],["2",'"',"\u00b2","\x00"],["3","\u2116","\u00a7","\u20b4"],["4",";","$","\u20ac"],["5","%","\u00b0","\x00"],["6",":","<","\x00"],["7","?",">","\x00"],["8","*","\u2022","\x00"],["9","(","[","{"],["0",")","]","}"],["-","_","\u2014","\u2013"],["=","+","\u2260","\u00b1"],["\u0439","\u0419"],["\u0446","\u0426"],["\u0443","\u0423","\u045e","\u040e"],["\u043a","\u041a","\u00ae","\x00"],["\u0435","\u0415","\u0451","\u0401"],["\u043d","\u041d"],["\u0433","\u0413"],
["\u0448","\u0428"],["\u0449","\u0429"],["\u0437","\u0417"],["\u0445","\u0425"],["\u0457","\u0407","\u044a","\u042a"],["\u0444","\u0424"],["\u0456","\u0406","\u044b","\u042b"],["\u0432","\u0412"],["\u0430","\u0410"],["\u043f","\u041f"],["\u0440","\u0420"],["\u043e","\u041e"],["\u043b","\u041b"],["\u0434","\u0414"],["\u0436","\u0416"],["\u0454","\u0404","\u044d","\u042d"],["\u0491","\u0490","\\","|"],["/","|","|","\u00a6"],["\u044f","\u042f"],["\u0447","\u0427"],["\u0441","\u0421","\u00a9","\x00"],
["\u043c","\u041c"],["\u0438","\u0418"],["\u0442","\u0422","\u2122","\x00"],["\u044c","\u042c"],["\u0431","\u0411","\u00ab","\u201e"],["\u044e","\u042e","\u00bb","\u201c"],[".",",","/","\u2026"],[" "," "]],B=[],C={},D=[192,49,50,51,52,53,54,55,56,57,48,189,187,81,87,69,82,84,89,85,73,79,80,219,221,65,83,68,70,71,72,74,75,76,186,222,220,226,90,88,67,86,66,78,77,188,190,191,32],E="Backquote Digit1 Digit2 Digit3 Digit4 Digit5 Digit6 Digit7 Digit8 Digit9 Digit0 Minus Equal KeyQ KeyW KeyE KeyR KeyT KeyY KeyU KeyI KeyO KeyP BracketLeft BracketRight KeyA KeyS KeyD KeyF KeyG KeyH KeyJ KeyK KeyL Semicolon Quote Backslash IntlBackslash KeyZ KeyX KeyC KeyV KeyB KeyN KeyM Comma Period Slash".split(" "),
F=0;F<A.length-1;F++){var G={};G.id=E[F];b(G,6);G.characters=A[F];G.keyCode=D[F];var H=y(G);B[d](H)}u(B,13,0,y({iconCssClass:"inputview-backspace-icon",type:13,id:"Backspace"}));u(B,14,0,y({iconCssClass:"inputview-tab-icon",type:14,id:"Tab"}));u(B,27,0,y({toState:4,name:"caps lock",type:5,id:"OsLeft"}));u(B,40,0,y({iconCssClass:"inputview-enter-icon",type:12,id:"Enter"}));u(B,41,0,x(!0));B[d](x(!1));B[d](y({iconCssClass:"inputview-globe-icon",type:27,id:"Globe"}));
B[d](y({iconCssClass:"inputview-menu-icon",toKeyset:void 0,type:26,id:"Menu"}));B[d](y({toState:8,name:"ctrl",type:5,id:"ControlLeft"}));B[d](y({toState:16,name:"alt",type:5,id:"AltLeft"}));B[d](y({name:" ",type:11,id:"Space"}));B[d](y({type:42,id:"enSwitcher"}));B[d](y({toState:2,name:"alt gr",type:5,id:"AltRight"}));B[d](z(2));B[d](z(3));B[d](y({iconCssClass:"inputview-hide-keyboard-icon",type:19,id:"HideKeyboard"}));for(F=0;F<B.length;F++)H=B[F],C[H.spec.id]="102kbd-k-"+F;var I=[];I.keyList=B;
I.mapping=C;I.layout="102kbd";I.hasAltGrKey=!0;I.hasCompactKeyboard=!1;I.showMenuKey=!0;I.id="ua";google.ime.chrome.inputview.onConfigLoaded(I);})();
