class LineupPlayer < ActiveRecord::Base
  belongs_to :lineup
  belongs_to :player
end
