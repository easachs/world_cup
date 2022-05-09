require './lib/player'
require './lib/team'
require './lib/world_cup'
require 'rspec'

RSpec.describe WorldCup do

  it "can make a player (iteration 1)" do
    player = Player.new({name: "Luka Modric", position: "midfielder"})
    expect(player.name).to eq("Luka Modric")
    expect(player.position).to eq("midfielder")
  end

  it "can make a team (iteration 2)" do
    team = Team.new("France")
    expect(team.country).to eq("France")
    expect(team.eliminated?).to be(false)
    team.eliminated = true
    expect(team.eliminated?).to be(true)
  end

  it "can add players and find players by position (iteration 2)" do
    team = Team.new("France")
    expect(team.players).to eq([])
    mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    team.add_player(mbappe)
    team.add_player(pogba)
    expect(team.players).to eq([mbappe, pogba])
    expect(team.players_by_position("midfielder")).to eq([pogba])
    expect(team.players_by_position("defender")).to eq([])
  end

  it "can create the 2018 world cup (iteration 3)" do
    france = Team.new("France")
    mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    france.add_player(mbappe)
    france.add_player(pogba)
    croatia = Team.new("Croatia")
    modric = Player.new({name: "Luka Modric", position: "midfielder"})
    vida = Player.new({name: "Domagoj Vida", position: "defender"})
    croatia.add_player(modric)
    croatia.add_player(vida)
    world_cup = WorldCup.new(2018, [france, croatia])
    expect(world_cup.year).to eq(2018)
    expect(world_cup.teams).to eq([france, croatia])
    expect(world_cup.active_players_by_position("midfielder")).to eq([pogba, modric])
    croatia.eliminated = true
    expect(world_cup.active_players_by_position("midfielder")).to eq([pogba])
  end

  it "can group all active players by position (iteration 4)" do
    france = Team.new("France")
    mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    france.add_player(mbappe)
    france.add_player(pogba)
    croatia = Team.new("Croatia")
    modric = Player.new({name: "Luka Modric", position: "midfielder"})
    vida = Player.new({name: "Domagoj Vida", position: "defender"})
    croatia.add_player(modric)
    croatia.add_player(vida)
    world_cup = WorldCup.new(2018, [france, croatia])
  end
end
