#+--------------------------------------------------------------------+
#| app.coffee
#+--------------------------------------------------------------------+
#| Copyright DarkOverlordOfData (c) 2013
#+--------------------------------------------------------------------+
#|
#| This file is a part of match3
#|
#| liquid.coffee is free software; you can copy, modify, and distribute
#| it under the terms of the MIT License
#|
#+--------------------------------------------------------------------+
#
# match3 demo app
#
keyboard = require('./keyboard')
start = ->
  FastClick?.attach document.body
  setTimeout( () ->
    #
    # Replace brand logo with product splash
    #
    document.getElementById("logo").style.display = 'none'
    document.body.style.backgroundColor = 'black'
    new keyboard.Game('game')
  ,1000)


window.addEventListener 'load', start, false