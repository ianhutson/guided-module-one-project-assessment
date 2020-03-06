class Lineup < ActiveRecord::Base
  belongs_to :user
  has_many :lineup_players
  has_many :players, through: :lineup_players
end
