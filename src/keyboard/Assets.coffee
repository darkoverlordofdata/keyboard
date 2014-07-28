#+--------------------------------------------------------------------+
#| Assets.coffee
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
# Load the game assets
#

alienzed = require('../alienzed')


class alienzed.Assets extends Phaser.State

  splashScreen: Phaser.Sprite

  preload: () ->

    #  Splash...
    @splashScreen = @add.sprite(0, 0, 'splashScreen')
    @load.setPreloadSprite @splashScreen

    #  Start loading the remaining game assets
    @load.image 'startButton',  'images/start_button.png'
    @load.image 'background',   'images/background2.png'
    @load.image 'board',        'images/background1.png'
    @load.spritesheet 'arrows', 'images/1195426512670548640kuba_arrow_button_set.svg.med.png', 75, 75

    @load.image 'arrow_right',  'images/arrows/right.png'
    @load.image 'arrow_left',   'images/arrows/left.png'
    @load.image 'arrow_down',   'images/arrows/down.png'
    @load.image 'arrow_lrot',   'images/arrows/lrot.png'
    @load.image 'arrow_rrot',   'images/arrows/rrot.png'

    @load.image 'gem_blue',     'assets/blueDude.png'
    @load.image 'gem_cyan',     'assets/cyanDude.png'
    @load.image 'gem_green',    'assets/greenDude.png'
    @load.image 'gem_magenta',  'assets/magentaDude.png'
    @load.image 'gem_orange',   'assets/orangeDude.png'
    @load.image 'gem_pink',     'assets/pinkDude.png'
    @load.image 'gem_red',      'assets/redDude.png'
    @load.image 'gem_yellow',   'assets/yellowDude.png'


  create: () ->

    @game.state.start 'Levels', true, false
