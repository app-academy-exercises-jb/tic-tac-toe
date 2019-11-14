require_relative "game.rb"


jb = Human_Player.new(:X)

so = Human_Player.new(:O)
bo = Computer_Player.new(:O)

game = Game.new(jb, so)