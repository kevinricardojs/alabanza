class Song < ActiveRecord::Base
  belongs_to :cantante
  belongs_to :album
  has_many :acordes, dependent: :destroy

  validates :nombre, presence: true
end
