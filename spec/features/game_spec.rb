require 'game'

describe Game do
  let(:player_1){Player.new("Jack")}
  let(:player_2){Player.new("Enrico")}
  subject(:game){described_class.new(player_1, player_2)}

  describe '.create' do
    it 'create a new Game object and stores it inside the @game class instance variable' do
      expect{described_class.create(player_1, player_2)}.not_to raise_error
    end
  end

  describe '.instance' do
    it 'returns the object created with .create' do
      described_class.create(player_1, player_2)
      expect(described_class.instance.class).to eq Game
    end
  end

  describe '#player_1' do
    it "stores an instance of player as player_1" do
      expect(game.player_1.name).to eq "Jack"
    end
  end

  describe '#player_2' do
    it "stores an instance of player as player_2" do
      expect(game.player_2.name).to eq "Enrico"
    end
  end

  describe '#active_player' do
    it 'returns the object of the active player' do
      expect(game.active_player).to eq player_1
    end
  end

  describe '#not_active_player' do
    it 'returns the object of the active player' do
      expect(game.not_active_player).to eq player_2
    end
  end

  describe '#change_turn' do
    it 'change the status of the turn keeper' do
      game.change_turn
      expect(game.active_player).to     eq(player_2)
      expect(game.not_active_player).to eq(player_1)

      game.change_turn
      expect(game.active_player).to     eq(player_1)
      expect(game.not_active_player).to eq(player_2)
    end
  end

  describe '#player_attack' do
    it 'can deduct hp from player' do
      game.player_attack
      expect(game.not_active_player.points).to eq(90)

      game.change_turn
      game.player_attack
      expect(game.not_active_player.points).to eq(90)
    end
  end
end
