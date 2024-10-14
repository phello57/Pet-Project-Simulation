# frozen_string_literal: true

module SETTINGS
  # Map
  MAP_LENGTH = 10
  MAP_WIDTH = 10

  # Spawn
  SPAWN_BEAR = 1
  SPAWN_GRASS = 10
  SPAWN_PIG = 2
  SPAWN_ROCK = 7
  SPAWN_TREE = 7

  # когда свиней на карте 0, спавним -
  ADDITIONAL_SPAWN_PIG = 2
  ADDITIONAL_SPAWN_GRASS = 6

  # Speed
  STEPS_PIG = 1
  STEPS_BEAR = 1

  # Hp
  HP_PIG = 30
  HP_BEAR = 30
  HP_GRASS = 5

  # Attack
  ATTACK_BEAR = 10
  ATTACK_PIG = 5

  # Stamina
  STAMINA_SUB_PER_ROUND = 5
  STAMINA_SUB_HP_PER_ROUND = 5
  STAMINA_PIG = 50
  STAMINA_BEAR = 100

  # When obj1 killed obj2, obj1 got:
  STAMINA_FROM_PIG = 70
  STAMINA_FROM_GRASS = 35
end
