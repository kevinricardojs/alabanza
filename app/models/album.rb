class Album < ActiveRecord::Base
  belongs_to :cantante
  has_many :acordes

  validates :nombre, presence: true
  validates :year, presence: true
end
