# frozen_string_literal: true

require_relative '../../../src/game/model/game_entities/Bear'
require_relative '../../../src/game/model/game_entities/Rock'
require_relative '../../../src/game/model/game_entities/Grass'
require_relative '../../../src/game/model/game_entities/Pig'
require_relative '../../../src/game/model/bfs/Node'
require_relative '../../../src/game/model/game_entities/game_map'
require_relative '../../../src/game/view/Render'
require_relative '../../../src/game/actions/Actions'


class Simulation
  attr_accessor :rounds, :count_rounds_from_user

  def initialize(action, render)
    @action = action
    @render = render

    @rounds = 1
    @count_rounds_from_user = 0
  end

  def start
    loop do
      puts ''
      puts ''
      puts ''
      puts "Раунд: #{@rounds}"

      @render.print_map

      ask_user

      @action.simulate

      @rounds += 1
    end
  end

  def ask_user
    if @count_rounds_from_user <= 0
      ask_value
      @count_rounds_from_user -= 1
    else
      @count_rounds_from_user -= 1
    end
  end

  def ask_value
    puts 'Введите число, сколько ходов нужно просимулировать'
    @count_rounds_from_user = gets.chomp.to_i

    return unless @rounds.negative?

    puts 'Введено не верное значение, Введите положительное число'
    ask_value
  end
end
