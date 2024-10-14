# frozen_string_literal: true

require_relative '../../../../src/game/model/game_entities/entity'


class Creature < Entity
  attr_accessor :hp, :current_goal, :set_goals, :stamina
  attr_reader :steps_per_round, :attack_points

  def initialize(node)
    super(node)
    @steps_per_round = nil
    @hp = 0
    @attack_points = 0
    @set_goals = Set.new
    @current_goal = nil
    @stamina = 0
  end

  def make_moves
    @steps_per_round.times do
      if @current_goal.nil?
        # стоим на месте
      elsif @current_goal.path_node.pointer_node.entity == self
        attack
      else
        do_step
      end
    end
  end

  def detect_current_goal
    @current_goal = if @current_goal.nil?  \
        || @current_goal.pointer_node.entity.nil?  \
        || @set_goals.include?(@current_goal.pointer_node.entity.class.to_s)
                      find_path
                    end
  end

  def find_path
    return nil if set_goals.nil?

    set_passed = Set.new << @node
    queue = [] << PathNode.new(@node, nil)

    # поиск в ширину, который делает из PathNode двунаправленный список от цели до сущности
    # PathNode <-> PathNode <-> PathNode <-> PathNode
    until queue.empty?
      path_node = queue.shift

      return nil if @set_goals.include?(path_node.pointer_node.entity)

      path_node.pointer_node.relations.each do |pointer_node|
        next if set_passed.include?(pointer_node)

        unless pointer_node.entity.nil?
          return PathNode.new(pointer_node, path_node) if @set_goals.include?(pointer_node.entity.class.to_s)

          # пускай ищет другой путь, где нет камней, деревьев и других нецелевых животных
          next
        end

        queue.push(PathNode.new(pointer_node, path_node))
        set_passed << pointer_node
      end
    end
  end

  def attack
    victim = @current_goal.pointer_node.entity

    victim.hp -= @attack_points

    return unless victim.hp.zero?

    name = victim.class.to_s
    if name == 'Pig'
      @stamina += SETTINGS::STAMINA_FROM_PIG
    elsif name == 'Grass'
      @stamina += SETTINGS::STAMINA_FROM_GRASS
    end
    self.current_goal = nil
    nil
  end

  def do_step
    # нужно в end_node дойти до начального узла, что бы свичнуть сущность
    # с первого узла на второй

    end_node = @current_goal

    begin
      end_node = end_node.path_node until end_node.path_node.path_node.pointer_node.nil?
    rescue StandardError
    end

    # здесь перекидываем нашу сущность на +1 клетку к цели
    end_node.path_node.pointer_node.entity = nil
    end_node.path_node = nil
    end_node.pointer_node.entity = self
    @node = end_node.pointer_node
  end

  def check_stamina
    @stamina -= SETTINGS::STAMINA_SUB_PER_ROUND

    return unless @stamina <= 0

    @hp -= SETTINGS::STAMINA_SUB_HP_PER_ROUND
  end
end
