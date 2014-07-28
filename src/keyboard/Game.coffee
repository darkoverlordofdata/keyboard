#+--------------------------------------------------------------------+
#| AlienZ.coffee
#+--------------------------------------------------------------------+
#| Copyright DarkOverlordOfData (c) 2014
#+--------------------------------------------------------------------+
#|
#| This file is a part of AlienZ
#|
#| AlienZ is free software; you can copy, modify, and distribute
#| it under the terms of the MIT License
#|
#+--------------------------------------------------------------------+
#
# Top level game object
#
#   "Yu Mo Gui Gwai Fai Di Zao" -- Uncle
#

alienzed = require('../alienzed')

class alienzed.Game extends Phaser.Game

  constructor: (dom) ->

    super 320, 480, Phaser.AUTO, dom

    @state.add 'Initialize',  alienzed.Initialize, false
    @state.add 'Assets',      alienzed.Assets, false
    @state.add 'Levels',      alienzed.Levels, false
    @state.add 'Level1',      alienzed.Level1, false

    @state.start 'Initialize'


