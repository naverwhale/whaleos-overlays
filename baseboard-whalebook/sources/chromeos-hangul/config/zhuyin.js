(function(){function a(f,p){return f.data=p}function b(f,p){return f.text=p}
var c="data",d="length",e="!",k='"',m="#",n="$",aa="%",q="&",r="'",ba="(",ca=")",s="*",da="+",t=",",u="-",v=".",ea="/",fa="0",ga="1",ha="2",ia="3",ja="4",ka="5",la="6",ma="7",na="8",oa="9",pa=":",qa=";",ra="<",sa="=",ta=">",ua="?",w="?123",va="@",wa="The number of switcher key spec is less than the number of switcher keys in the keyset.",xa="The number of switcher key spec is more than the number of switcher keys in the keyset.",za="[",Aa="\\",Ba="]",Ca="^",Da="_",Ea="`",Fa="compactkbd-k-",Ga="compactkbd-k-key-",
x="compactkbd-qwerty",Ha="english main layout",Ia="english more symbols layout",Ja="english number and symbol layout",Ka="inputview-shift-icon",La="main layout",Ma="more symbols layout",Na="number and symbol layout",Oa="{",Pa="|",Qa="}",Ra="~",Sa="\u00a1",Ta="\u00a2",Ua="\u00a3",Va="\u00a5",Wa="\u00a7",Xa="\u00a9",y="\u00ab",Ya="\u00ae",Za="\u00b0",$a="\u00b1",ab="\u00b2",bb="\u00b3",cb="\u00b6",db="\u00b7",eb="\u00b9",A="\u00bb",fb="\u00bc",gb="\u00bd",hb="\u00be",ib="\u00bf",jb="\u00d7",kb="\u00f7",
lb="\u0394",mb="\u03a0",nb="\u03c0",ob="\u2013",pb="\u2014",qb="\u2018",rb="\u2019",sb="\u201a",tb="\u201c",ub="\u201d",vb="\u201e",wb="\u2020",xb="\u2021",yb="\u2022",B="\u2026",zb="\u2030",Ab="\u2032",Bb="\u2033",C="\u2039",D="\u203a",Cb="\u2074",Db="\u207f",Eb="\u20ac",Fb="\u20b1",Gb="\u2105",Hb="\u2122",Ib="\u2153",Jb="\u2154",Kb="\u215b",Lb="\u215c",Mb="\u215d",Nb="\u215e",Ob="\u2190",Pb="\u2191",Qb="\u2192",Rb="\u2193",Sb="\u2205",Tb="\u221e",Ub="\u2248",Vb="\u2260",Wb="\u2264",Xb="\u2265",
Yb="\u23b7",Zb="\u2605",$b="\u2660",ac="\u2663",bc="\u2665",cc="\u2666",dc="\u266a";
function ec(){return[{text:Ra},{text:Ea},{text:Pa},{text:yb,moreKeys:[dc,bc,$b,cc,ac]},{text:Yb},{text:nb,moreKeys:[mb]},{text:kb},{text:jb},{text:cb,moreKeys:[Wa]},{text:lb},E,{text:Ua,marginLeftPercent:.33},{text:Ta},{text:Eb},{text:Va},{text:Ca,moreKeys:[Pb,Rb,Ob,Qb]},{text:Za,moreKeys:[Ab,Bb]},{text:sa,moreKeys:[Vb,Ub,Tb]},{text:Oa},{text:Qa},F,G,{text:Aa},{text:Xa},{text:Ya},{text:Hb},{text:Gb},{text:za},{text:Ba},{text:Sa},{text:ib},G,G,{text:ra,isGrey:!0,moreKeys:[C,Wb,y]},H,{text:ta,isGrey:!0,
moreKeys:[D,Xb,A]},I,{text:t,isGrey:!0},{text:v,isGrey:!0,moreKeys:[B]},J]}
function fc(){return[{text:ga,moreKeys:[eb,gb,Ib,fb,Kb]},{text:ha,moreKeys:[ab,Jb]},{text:ia,moreKeys:[bb,hb,Lb]},{text:ja,moreKeys:[Cb]},{text:ka,moreKeys:[Mb]},{text:la},{text:ma,moreKeys:[Nb]},{text:na},{text:oa},{text:fa,moreKeys:[Db,Sb]},E,{text:va,marginLeftPercent:.33},{text:m},{text:n,moreKeys:[Ta,Ua,Eb,Va,Fb]},{text:aa,moreKeys:[zb]},{text:q},{text:u,moreKeys:[Da,ob,pb,db]},{text:da,moreKeys:[$a]},{text:ba,moreKeys:[Oa,ra,za]},{text:ca,moreKeys:[Qa,ta,Ba]},F,G,{text:Aa},{text:sa},{text:s,
moreKeys:[wb,xb,Zb]},{text:k,moreKeys:[tb,vb,ub,y,A]},{text:r,moreKeys:[qb,sb,rb,C,D]},{text:pa},{text:qa},{text:e,moreKeys:[Sa]},{text:ua,moreKeys:[ib]},G,G,{text:Da,isGrey:!0},H,{text:ea,isGrey:!0},I,{text:t,isGrey:!0},{text:v,isGrey:!0,moreKeys:[B]},J]}
function K(f){for(var p=[],z={},h=0;h<f[c][d];h++){var l=f[c][h];l==H&&(l.toKeyset=f.id.split(v)[0]);var g;g=l;g.id=l.id?l.id:Ga+h;g.type||(g.type=22);var l={},ya=void 0;for(ya in g)l[ya]=g[ya];g={spec:l};p.push(g);z[g.spec.id]=Fa+h}return{keyList:p,mapping:z,layout:f.layout}}function L(f,p){for(var z=0,h=0;h<f[d];h++)if(f[h]==G){if(z>=p[d]){console.error(wa);return}var l=p[z++],g;for(g in f[h])l[g]=f[h][g];f[h]=l}z<p[d]-1&&console.error(xa)};var E={iconCssClass:"inputview-backspace-icon",type:13,id:"Backspace"},F={iconCssClass:"inputview-enter-icon",type:12,id:"Enter"},J={iconCssClass:"inputview-hide-keyboard-icon",type:19,id:"HideKeyboard"},gc={toState:1,iconCssClass:Ka,type:5,id:"ShiftRight",supportSticky:!0},I={name:" ",type:11,id:"Space"},G={type:21},H={iconCssClass:"inputview-menu-icon",type:26,id:"Menu"},hc={iconCssClass:"inputview-globe-icon",type:27,id:"Globe"};for(var M={id:"zhuyin.compact.qwerty",layout:"compactkbd-zhuyin"},N=[{text:"\u3105",hintText:ga,moreKeys:["\uff01"]},{text:"\u3109",hintText:ha,moreKeys:[va]},{text:"\u02c7",hintText:ia,moreKeys:[m]},{text:"\u02cb",hintText:ja,moreKeys:[n]},{text:"\u3113",hintText:ka,moreKeys:[aa]},{text:"\u02ca",hintText:la,moreKeys:[Ca]},{text:"\u02d9",hintText:ma,moreKeys:[q]},{text:"\u311a",hintText:na,moreKeys:[s]},{text:"\u311e",hintText:oa,moreKeys:["\uff08"]},{text:"\u3122",hintText:fa,moreKeys:["\uff09"]},
{text:"\u3106",hintText:"q",moreKeys:["Q"],textCode:["Q"]},{text:"\u310a",hintText:"w",moreKeys:["W"],codeKeys:["Q"]},{text:"\u310d",hintText:"e",moreKeys:["E"],textCode:["Q"]},{text:"\u3110",hintText:"r",moreKeys:["R"]},{text:"\u3114",hintText:"t",moreKeys:["T"]},{text:"\u3117",hintText:"y",moreKeys:["Y"]},{text:"\u3127",hintText:"u",moreKeys:["U"]},{text:"\u311b",hintText:"i",moreKeys:["I"]},{text:"\u311f",hintText:"o",moreKeys:["O"]},{text:"\u3123",hintText:"p",moreKeys:["P"]},{text:"\u3107",hintText:"a",
moreKeys:["A"]},{text:"\u310b",hintText:"s",moreKeys:["S"]},{text:"\u310e",hintText:"d",moreKeys:["D"]},{text:"\u3111",hintText:"f",moreKeys:["F"]},{text:"\u3115",hintText:"g",moreKeys:["G"]},{text:"\u3118",hintText:"h",moreKeys:["H"]},{text:"\u3128",hintText:"j",moreKeys:["J"]},{text:"\u311c",hintText:"k",moreKeys:["K"]},{text:"\u3120",hintText:"l",moreKeys:["L"]},{text:"\u3124",hintText:"\uff1a"},{text:"\u3108",hintText:"z",moreKeys:["Z"]},{text:"\u310c",hintText:"x",moreKeys:["X"]},{text:"\u310f",
hintText:"c",moreKeys:["C"]},{text:"\u3112",hintText:"v",moreKeys:["V"]},{text:"\u3116",hintText:"b",moreKeys:["B"]},{text:"\u3119",hintText:"n",moreKeys:["N"]},{text:"\u3129",hintText:"m",moreKeys:["M"]},{text:"\u311d",hintText:B},{text:"\u3121",hintText:"\uff01"},{text:"\u3125",hintText:"\uff1f"},E,F,gc,G,hc,H,{text:"\uff0c",isGrey:!0},I,{text:"\u3126",isGrey:!1},{text:"\u3002",isGrey:!0},G,J],O=0;39>=O;O++)N[O].moreKeysShiftOperation=2;for(O=0;39>=O;O++)N[O].onShift=N[O].hintText.toUpperCase();
a(M,N);
for(var P={id:"zhuyin.en.compact.qwerty",layout:x},Q=[{text:"q",hintText:ga,moreKeys:["Q","q"]},{text:"w",hintText:ha,moreKeys:["W","w"]},{text:"e",hintText:ia,moreKeys:["E","e"]},{text:"r",hintText:ja,moreKeys:["R","r"]},{text:"t",hintText:ka,moreKeys:["T","t"]},{text:"y",hintText:la,moreKeys:["Y","y"]},{text:"u",hintText:ma,moreKeys:["U","u"]},{text:"i",hintText:na,moreKeys:["I","i"]},{text:"o",hintText:oa,moreKeys:["O","o"]},{text:"p",hintText:fa,moreKeys:["P","p"]},E,{text:"a",hintText:va,marginLeftPercent:.33,
moreKeys:["A","a"]},{text:"s",hintText:s,moreKeys:["S","s"]},{text:"d",hintText:da,moreKeys:["D","d"]},{text:"f",hintText:u,moreKeys:["F","f"]},{text:"g",hintText:sa,moreKeys:["G","g"]},{text:"h",hintText:ea,moreKeys:["H","h"]},{text:"j",hintText:m,moreKeys:["J","j"]},{text:"k",hintText:"\uff08",moreKeys:["K","k"]},{text:"l",hintText:"\uff09",moreKeys:["L","l"]},F,{toState:1,iconCssClass:Ka,type:5,id:"ShiftLeft",supportSticky:!0},{text:"z",hintText:"\u3001",moreKeys:["Z","z"]},{text:"x",hintText:"\uff1a",
moreKeys:["X","x"]},{text:"c",hintText:k,moreKeys:["C","c"]},{text:"v",hintText:"\uff1f",moreKeys:["V","v"]},{text:"b",hintText:"\uff01",moreKeys:["B","b"]},{text:"n",hintText:"\uff5e",moreKeys:["N","n"]},{text:"m",hintText:v,moreKeys:["M","m"]},{text:"\uff01",moreKeys:[Sa]},{text:"\uff1f",moreKeys:[ib]},gc,G,hc,H,{text:"\uff0c",isGrey:!0},I,{text:"\u3002",isGrey:!0},G,J],R=0;9>=R;R++)Q[R].moreKeysShiftOperation=2;for(R=11;19>=R;R++)Q[R].moreKeysShiftOperation=2;
for(R=22;28>=R;R++)Q[R].moreKeysShiftOperation=2;for(var S=0;9>=S;S++)Q[S].moreKeys.pop();for(S=11;19>=S;S++)Q[S].moreKeys.pop();for(S=22;28>=S;S++)Q[S].moreKeys.pop();Q[12].hintText=s;Q[14].hintText=u;Q[16].hintText=ea;Q[18].hintText=ba;Q[19].hintText=ca;Q[22].hintText=r;Q[23].hintText=pa;Q[25].hintText=ua;Q[26].hintText=e;Q[27].hintText=Ra;Q[28].hintText=B;b(Q[29],e);b(Q[30],ua);b(Q[35],t);b(Q[37],v);a(P,Q);var T={id:"zhuyin.compact.symbol",layout:x},U=fc();b(U[13],Va);
U[13].moreKeys=[n,Ta,Ua,Eb,Fb];b(U[15],q);b(U[18],"\uff08");U[18].moreKeys=["\uff5b","\u300a","\uff3b","\u3010"];b(U[19],"\uff09");U[19].moreKeys=["\uff5d","\u300b","\uff3d","\u3001"];b(U[22],"\u3001");b(U[25],tb);U[25].moreKeys=[k,y];b(U[26],ub);U[26].moreKeys=[k,A];b(U[27],"\uff1a");b(U[28],"\uff1b");b(U[29],qb);U[29].moreKeys=[r,C];b(U[30],rb);U[30].moreKeys=[r,D];b(U[33]," \u2014");U[33].moreKeys=void 0;b(U[35],B);U[35].moreKeys=void 0;b(U[37],"\uff0c");b(U[38],"\u3002");a(T,U);
var V={id:"zhuyin.en.compact.symbol",layout:x};a(V,fc());var W={id:"zhuyin.compact.more",layout:x},X=ec();b(X[0],"\uff5e");b(X[15],Za);X[15].moreKeys=[Ab,Bb];b(X[16],"\u300e");X[16].moreKeys=void 0;b(X[17],"\u300f");X[17].moreKeys=void 0;b(X[18],"\uff5b");b(X[19],"\uff5d");b(X[22],"\uff0f");X[22].moreKeys=void 0;b(X[27],"\uff3b");b(X[28],"\uff3d");b(X[29],"\u3010");X[29].moreKeys=void 0;b(X[30],"\u3011");X[30].moreKeys=void 0;b(X[33],"\u300a");X[33].moreKeys=[C,Wb,y];b(X[35],"\u300b");
X[35].moreKeys=[D,Xb,A];b(X[37],"\uff0c");b(X[38],"\u3002");a(W,X);var Y={id:"zhuyin.en.compact.more",layout:x};a(Y,ec());var Z=google.ime.chrome.inputview.onConfigLoaded;L(M[c],[{name:w,toKeyset:T.id,toKeysetName:Na},{toKeyset:P.id,toKeysetName:Ha,iconCssClass:"inputview-switcher-chinese"}]);var $=K(M);$.id=M.id;$.showMenuKey=!0;Z($);L(P[c],[{name:w,toKeyset:V.id,toKeysetName:Ja},{toKeyset:M.id,toKeysetName:La,iconCssClass:"inputview-switcher-english"}]);$=K(P);$.id=P.id;$.showMenuKey=!0;Z($);
L(T[c],[{name:"~[<",toKeyset:W.id,toKeysetName:Ma},{name:"~[<",toKeyset:W.id,toKeysetName:Ma},{name:"abc",toKeyset:M.id,toKeysetName:La}]);$=K(T);$.id=T.id;$.showMenuKey=!1;$.noShift=!0;Z($);L(V[c],[{name:"~[<",toKeyset:Y.id,toKeysetName:Ia},{name:"~[<",toKeyset:Y.id,toKeysetName:Ia},{name:"abc",toKeyset:P.id,toKeysetName:Ha}]);$=K(V);$.id=V.id;$.showMenuKey=!1;$.noShift=!0;Z($);L(W[c],[{name:w,toKeyset:T.id,toKeysetName:Na},{name:w,toKeyset:T.id,toKeysetName:Na},{name:"abc",toKeyset:M.id,toKeysetName:La}]);
$=K(W);$.id=W.id;$.showMenuKey=!1;$.noShift=!0;Z($);L(Y[c],[{name:w,toKeyset:V.id,toKeysetName:Ja},{name:w,toKeyset:V.id,toKeysetName:Ja},{name:"abc",toKeyset:P.id,toKeysetName:Ha}]);$=K(Y);$.id=Y.id;$.showMenuKey=!1;$.noShift=!0;Z($);})();