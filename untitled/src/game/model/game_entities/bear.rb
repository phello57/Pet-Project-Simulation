# frozen_string_literal: true

require_relative '../../../../src/game/view/render'
require_relative '../../../../src/game/model/game_entities/creature'
require_relative '../../../../src/game/model/game_entities/pig'

class Bear < Creature
  def initialize(node)
    super(node)
    @emoji = Render::EMOJI_BEAR
    @steps_per_round = SETTINGS::STEPS_BEAR
    @hp = SETTINGS::HP_BEAR
    @attack_points = SETTINGS::ATTACK_BEAR
    @stamina = SETTINGS::STAMINA_BEAR

    # Список существ, которые являются целью уничтожения
    @set_goals.add('Pig')
  end
end
