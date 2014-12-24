class SnowyLoader
	createCanvas: (name) ->
		s = document.createElement 'canvas'
		s.id = name
		s.style.position = 'absolute'
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

document.addEventListener 'DOMContentLoaded', ->
	l = new SnowyLoader
	l.createCanvas 'snowyCanvas'
	cjs = l.setScript 'http://code.createjs.com/createjs-2014.12.12.min.js','head'
	cjs.onload = ->
		sb = l.setScript 'snowybase.js','head'
		sb.onload = ->
			initSnowy()
	initSnowy = ->
		s = new Snowy 'snowyCanvas'