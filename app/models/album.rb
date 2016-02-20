class Album < ActiveRecord::Base
  belongs_to :cantante
  has_many :songs, dependent: :destroy

  validates :nombre, presence: true
  validates :year, presence: true
end
