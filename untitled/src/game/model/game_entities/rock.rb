# frozen_string_literal: true

require_relative '../../../../src/game/view/render'
require_relative '../../../../src/game/model/game_entities/creature'


class Rock < Creature
  def initialize(node)
    super(node)
    @emoji = Render::EMOJI_ROCK
  end
end
