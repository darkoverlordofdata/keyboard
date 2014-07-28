#+--------------------------------------------------------------------+
#| GemGroup.coffee
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

# GemGroup class
class alienzed.GemGroup
  constructor: (level) ->
    x = 0

    patterns = require('./patterns.json')
    currentPattern = 0

    # Create 2 gems
    gems =
      first: new alienzed.Gem(level, level.randomGemType(), x + patterns[currentPattern].first.x, patterns[currentPattern].first.y)
      second: new alienzed.Gem(level, level.randomGemType(), x + patterns[currentPattern].second.x, patterns[currentPattern].second.y)

    #
    # Update Positions method
    #
    @updatePositions = ->
      pattern = patterns[currentPattern]
      gems.first.move x + pattern.first.x, pattern.first.y
      gems.second.move x + pattern.second.x, pattern.second.y

    #
    # Drop method
    #
    @drop = ->

      # Get the pattern
      pattern = patterns[currentPattern]
      # Drop counter
      dropped = 0
      # gems to drop
      gemsCount = pattern.order.length
      # Drop gems in order
      for i of pattern.order
        gems[pattern.order[i]].drop ->
          dropped += 1
          # If all gems have been dropped
          level.handleMatches() if dropped is gemsCount

      return

    #
    # Move method
    #
    @move = (amount) ->

      # new x position
      newX = x + amount
      # if current pattern is 1 or 3 max x is 4
      maxX = (if (currentPattern is 1 or currentPattern is 3) then 4 else 5)
      # if x is >= to 0 and <0 maxX
      # we can update x
      x = newX  if newX >= 0 and newX <= maxX
      # Update positions
      @updatePositions()

    #
    # Rotate method
    #
    @rotate = (d = 1) ->

      # Update the current pattern
      currentPattern = currentPattern + d
      if currentPattern >= patterns.length
        currentPattern = 0
      else if currentPattern < 0
        currentPattern = patterns.length-1

      # If x is 5 and current pattern is 1 or 3
      # We must set x to 4
      x = 4  if x is 5 and (currentPattern is 1 or currentPattern is 3)
      # Update positions
      @updatePositions()

