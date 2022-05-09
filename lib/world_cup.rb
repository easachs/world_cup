require_relative 'player'
require_relative 'team'

class WorldCup

  attr_reader :year, :teams

  def initialize(year, teams)
    @year = year
    @teams = teams
  end

  def active_players_by_position(pos)
    active_teams = @teams.find_all do |t|
      t.eliminated == false
    end
    active_players = active_teams.map do |t|
      t.players.find_all do |p|
        p.position == pos
      end
    end.flatten
  end

  def all_players_by_position
    active_teams = @teams.find_all do |t|
      t.eliminated == false
    end
    all_players = active_teams.map do |t|
      t.players
    end.flatten
    players_by_position = all_players.group_by do |p|
      p.position
    end
  end
end
