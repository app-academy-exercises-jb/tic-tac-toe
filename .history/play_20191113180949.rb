require_relative "game.rb"


jb = Human_Player.new(:X)
bo = Human_Player.new(:O)

game = Game.new(jb, bo)