# frozen_string_literal: true

require_relative '../../../../src/game/view/render'
require_relative '../../../../src/game/model/game_entities/creature'
require_relative '../../../../src/game/model/game_entities/grass'

class Pig < Creature
  def initialize(node)
    super(node)
    @emoji = Render::EMOJI_PIG
    @steps_per_round = SETTINGS::STEPS_PIG
    @hp = SETTINGS::HP_PIG
    @attack_points = SETTINGS::ATTACK_PIG
    @stamina = SETTINGS::STAMINA_PIG

    # Список существ, которые являются целью уничтожения
    @set_goals.add('Grass')
  end
end
