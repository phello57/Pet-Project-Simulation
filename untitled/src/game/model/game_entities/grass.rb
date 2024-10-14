# frozen_string_literal: true

require_relative '../../../../src/game/view/render'
require '../../../src/game/model/game_entities/creature'

class Grass < Creature
  def initialize(node)
    super(node)
    @hp = SETTINGS::HP_GRASS
    @emoji = Render::EMOJI_GRASS
  end
end
