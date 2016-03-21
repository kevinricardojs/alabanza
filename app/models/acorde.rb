class Acorde < ActiveRecord::Base
  belongs_to :song

  validates :acorde, presence: true
end
