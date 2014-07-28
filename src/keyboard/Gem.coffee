#+--------------------------------------------------------------------+
#| Gem.coffee
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
jMatch3 = require('../jmatch3')
alienzed = require('../alienzed')

# Gem class
class alienzed.Gem

  constructor: (@level, @type, x, y) ->
    @sprite = @level.add.sprite(0, 0, "gem_#{type}")
    @move(x, y)

  #
  # Move method
  #
  move: (x, y) ->
    @x = x
    @y = y
    @sprite.x = @x * alienzed.GEMSIZE
    @sprite.y = @y * alienzed.GEMSIZE

  #
  # Drop method
  #
  drop: (callback) ->
    # Get the gem column
    column = @level.grid.getColumn(@x)
    # Get the last empty piece to place the gem
    lastEmpty = jMatch3.Grid.getLastEmptyPiece(column)
    # If an empty piece has been found
    if lastEmpty
      # Bind this gem to the piece
      lastEmpty.object = @
      # And make it fall
      @fall(lastEmpty.x, lastEmpty.y, callback)
    else
      # Game Over
      @level.gameOver()

  #
  # Fall method
  #
  fall: (x, y, callback) ->
    callback = callback or ()->
    # Create a tween animation
    @level.add.tween(@sprite).to({
      x: x * alienzed.GEMSIZE
      y: alienzed.MARGINTOP * alienzed.GEMSIZE + y * alienzed.GEMSIZE
      }, 500, Phaser.Easing.Bounce.Out, true).onComplete.add(callback)

