require_relative 'player'

class Team

  attr_accessor :country, :eliminated, :players

  def initialize(country)
    @country = country
    @eliminated = false
    @players = []
  end

  def eliminated?
    @eliminated
  end

  def add_player(player)
    @players << player
  end

  def players_by_position(pos)
    @players.find_all do |p|
      p.position == pos
    end
  end
end
