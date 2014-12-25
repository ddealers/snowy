# Snowify.me

Un sencillo script para divertirse generando un efecto de nevada en cualquier página web.
Si deseas jugar con el script, sólo selecciona el código que está debajo y arrástralo a la barra de favoritos de tu navegador y da click en el link que se genera.

```
javascript:(function(){var SnowyLoader,cjs,initSnowy,l;SnowyLoader=function(){function SnowyLoader(){}SnowyLoader.prototype.createCanvas=function(name){var s,t;s=document.createElement('canvas');s.id=name;s.style.position='fixed';s.style.zIndex=100;s.style.top=0;s.style.left=0;s.style.pointerEvents='none';t=document.body;return t.appendChild(s)};SnowyLoader.prototype.setScript=function(src,tag){var s,t;s=document.createElement('script');s.type='text/javascript';s.src=src;t=document.querySelector(tag);return t.appendChild(s)};return SnowyLoader}();l=new SnowyLoader;l.createCanvas('snowyCanvas');cjs=l.setScript('https://code.createjs.com/createjs-2014.12.12.min.js','head');cjs.onload=function(){var sb;sb=l.setScript('https://cdn.rawgit.com/ddealers/snowy/v1.0/snowybase.js','head');return sb.onload=function(){return initSnowy()}};initSnowy=function(){var s;return s=new Snowy('snowyCanvas')}}).call(this);
```