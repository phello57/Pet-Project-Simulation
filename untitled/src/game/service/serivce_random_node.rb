# frozen_string_literal: true

class ServiceRandomNode
  def initialize(world)
    @game_map = world
  end

  def get
    w = 0
    l = 0
    loop do
      w = rand(@game_map.MAP_WIDTH)
      l = rand(@game_map.MAP_LENGTH)

      break if @game_map.GAME_MAP[w][l].entity.nil?
    end

    @game_map.GAME_MAP[w][l]
  end
end
