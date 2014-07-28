#+--------------------------------------------------------------------+
#| Levels.coffee
#+--------------------------------------------------------------------+
#| Copyright DarkOverlordOfData (c) 2014
#+--------------------------------------------------------------------+
#|
#| This file is a part of alienzed
#|
#| alienzed is free software; you can copy, modify, and distribute
#| it under the terms of the MIT License
#|
#+--------------------------------------------------------------------+
#
# Levels Menu
#

alienzed = require('../alienzed')

class alienzed.Levels extends Phaser.State

  menu: Phaser.Sprite
  background: Phaser.Sprite
  startButton: Phaser.Sprite
  level: 1

  create:() ->

    @background = @add.sprite(0, 0, 'splashScreen')
    @startButton = @add.button(@world.centerX - 95, 350, 'startButton', @startGame, @, 2, 1, 0)



  startGame:() ->

    @game.state.start "Level#{@level}", true, false
