(this["webpackJsonpwhats-my-ip"]=this["webpackJsonpwhats-my-ip"]||[]).push([[0],{11:function(e,t,c){},13:function(e,t,c){"use strict";c.r(t);var n=c(1),s=c(5),r=c.n(s),a=(c(11),c(6)),o=c.n(a),i=c(0),l=function(e){return Object(i.jsx)("div",{className:o.a.card,children:e.children})},d=c(4),j=c(2),b=c.n(j),h=function(e){return Object(i.jsx)(l,{children:Object(i.jsx)("img",{src:"https://maps.googleapis.com/maps/api/staticmap?center=".concat(e.lat,",%20").concat(e.lon,"&zoom=6&size=400x400&markers=color:red%7C").concat(e.lat,",%20").concat(e.lon,"&key=AIzaSyAWX9QUI_bRFnTghPg0yAOhkKpaGhwXt3k"),alt:""})})},p=function(){var e=Object(n.useState)({}),t=Object(d.a)(e,2),c=t[0],s=t[1],r=Object(n.useState)(null),a=Object(d.a)(r,2),o=a[0],l=a[1];return Object(n.useEffect)((function(){fetch("http://ip-api.com/json/").then((function(e){if(e.ok)return l(null),e.json();throw Error("Failed to fetch IP Address")})).then((function(e){console.log(e),s(e)})).catch((function(e){return l("Failed to retrieve IP Address, please try again later")}))}),[]),Object(i.jsxs)("div",{children:[!o&&Object(i.jsxs)(i.Fragment,{children:[Object(i.jsxs)("div",{className:b.a.info,children:[Object(i.jsxs)("p",{children:[Object(i.jsx)("span",{className:b.a.bold,children:"Public IPv4 Address: "}),c.query]}),Object(i.jsxs)("p",{children:[Object(i.jsx)("span",{className:b.a.bold,children:"Internet Service Provider: "}),c.isp]}),Object(i.jsxs)("p",{children:[Object(i.jsx)("span",{className:b.a.bold,children:"Location: "}),c.city,", ",c.country]})]}),Object(i.jsx)(h,{lat:c.lat,lon:c.lon})]}),o&&Object(i.jsx)("p",{children:o})]})};var u=function(){return Object(i.jsxs)(l,{children:[Object(i.jsx)("h1",{children:"Your IP address is..."}),Object(i.jsx)(p,{})]})};r.a.render(Object(i.jsx)(u,{}),document.getElementById("root"))},2:function(e,t,c){e.exports={info:"IpAddress_info__2XEsY",bold:"IpAddress_bold__ds2gm"}},6:function(e,t,c){e.exports={card:"Card_card__2nKG4"}}},[[13,1,2]]]);
//# sourceMappingURL=main.26d8ac59.chunk.js.map