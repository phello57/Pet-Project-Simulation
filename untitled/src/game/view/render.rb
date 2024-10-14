# frozen_string_literal: true

require '../../../src/game/model/game_entities/game_map'

class Render
  EMOJI_TREE ||= '🌴'
  EMOJI_ROCK ||= '🏔️'
  EMOJI_GRASS ||= '🌿'
  EMOJI_BEAR ||= '🐻'
  EMOJI_PIG ||= '🐷'
  EMOJI_VOID ||= '. '

  attr_reader :world

  def initialize(world)
    @world = world
  end

  def print_map
    world = @world.GAME_MAP

    puts ''

    0..@world.MAP_WIDTH.times do |w|
      0..@world.MAP_LENGTH.times do |l|
        node = world[w][l]

        print node.entity.nil? ? EMOJI_VOID : node.entity.emoji
      end
      puts ' '
    end
  end
end
