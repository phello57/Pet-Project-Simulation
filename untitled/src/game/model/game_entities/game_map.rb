# frozen_string_literal: true

require_relative '../../../../src/game/model/bfs/node'
require_relative '../../../../src/game/model/bfs/path_node'
require_relative '../../../../src/game/model/game_entities/entity'



class GameMap
  attr_reader :GAME_MAP, :MAP_LENGTH, :MAP_WIDTH, :entities_with_hp

  def initialize(w, l)
    @MAP_LENGTH = l
    @MAP_WIDTH = w
    @GAME_MAP = Array.new(w) { Array.new(l, Node.new) }
    @entities_with_hp = Set.new

    create_map
  end

  def add_entity_to_map(entity, node)
    node.entity = entity

    return unless %w[Pig Bear Grass].include?(entity.class.to_s)

    @entities_with_hp.add(entity)
  end

  def create_map
    @MAP_WIDTH.times do |w|
      @MAP_LENGTH.times do |l|
        create_map_cell(w, l, Node.new)
      end
    end
    create_relations_of_nodes
  end

  def create_map_cell(w, l, node)
    @GAME_MAP[w][l] = node
  end

  def create_relations_of_nodes
    @MAP_WIDTH.times do |w|
      @MAP_LENGTH.times do |l|
        add_nearest_nodes_to_arr_relations(w, l)
      end
    end
  end

  def add_nearest_nodes_to_arr_relations(w, l)
    node = @GAME_MAP[w][l]

    create(w - 1, l - 1, node) # верх лево
    create(w - 1, l, node) # центр верх
    create(w - 1, l + 1, node) # верх право
    create(w, l - 1, node)  # центр лево
    create(w, l + 1, node)  # центр право
    create(w + 1, l - 1, node) # лево низ
    create(w + 1, l, node) # центр низ
    create(w + 1, l + 1, node) # право низ
  end

  def create(w, l, node)
    node.relations.push(@GAME_MAP[w][l]) if is_cell_valid(w, l)
  end

  def is_cell_valid(w, l)
    l >= 0 && @MAP_LENGTH > l && w >= 0 && @MAP_WIDTH > w
  end
end
