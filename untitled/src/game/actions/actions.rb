# frozen_string_literal: true

require '../../../src/game/actions/create_entities'
require '../../../src/game/model/game_entities/game_map'

class Actions
  def initialize(world, is_logger_turn)
    @game_map = world
    @create_entities = CreateEntities.new(world)

    @create_entities.create_entities
    @is_logger_turn = is_logger_turn
  end

  def simulate
    count_pigs = 0

    @game_map.entities_with_hp.each do |creature|
      if creature.hp <= 0
        @game_map.entities_with_hp.delete(creature)
        creature.node.entity = nil
        next
      end

      next if creature.instance_of?(::Grass)

      logs(creature) if @is_logger_turn

      creature.check_stamina
      creature.detect_current_goal

      creature.make_moves unless creature.current_goal.nil?

      count_pigs += 1 if creature.instance_of?(::Pig)
    end

    @create_entities.add_entities if count_pigs.zero?
  end

  def logs(creature)
    puts '-------------------------'
    puts "Сущность: #{creature.class}"
    if !creature.current_goal.nil?
      puts "Цель: #{creature.current_goal.pointer_node.entity.class}"
    else
      puts 'Цели нет'
    end
    puts "HP: #{creature.hp}"
    puts "Стамина существа #{creature.stamina}"
  end
end
