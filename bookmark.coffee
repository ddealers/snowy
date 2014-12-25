class SnowyLoader
	createCanvas: (name) ->
		s = document.createElement 'canvas'
		s.id = name
		s.style.position = 'fixed'
		s.style.zIndex = 100
		s.style.top = 0
		s.style.left = 0
		s.style.pointerEvents = 'none'
		t = document.body
		t.appendChild s

	setScript: (src, tag) ->
		s = document.createElement 'script'
		s.type = 'text/javascript'
		s.src = src
		t = document.querySelector tag
		t.appendChild s

l = new SnowyLoader
l.createCanvas 'snowyCanvas'
cjs = l.setScript 'https://code.createjs.com/createjs-2014.12.12.min.js','head'
cjs.onload = ->
	sb = l.setScript 'https://cdn.rawgit.com/ddealers/snowy/master/snowybase.js#1','head'
	sb.onload = ->
		initSnowy()
initSnowy = ->
	s = new Snowy 'snowyCanvas'