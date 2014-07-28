#+--------------------------------------------------------------------+
#| alienzed.coffee
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
# Game namespace
#
module.exports = class alienzed

  @GEMSIZE    = 48    # Gem size constant in pixels
  @MARGINTOP  = 2     # Margin top equal to 2 gems height
  @GEMTYPES   = [     # All gem types:
    "blue"
    "cyan"
    "green"
    "magenta"
    "orange"
    "pink"
    "red"
    "yellow"
  ]


require './Assets'
require './Game'
require './Gem'
require './GemGroup'
require './Initialize'
require './Levels'
require './Level1'


