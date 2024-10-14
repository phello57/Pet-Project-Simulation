# frozen_string_literal: true

require '../../../src/game/launch/simulation'

game_map = GameMap.new(SETTINGS::MAP_WIDTH, SETTINGS::MAP_LENGTH)
action = Actions.new(game_map, true)
render = Render.new(game_map)

simulation = Simulation.new(action, render)
simulation.start
