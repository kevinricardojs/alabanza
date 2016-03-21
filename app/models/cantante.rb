class Cantante < ActiveRecord::Base
  include FriendlyId
  friendly_id :nombre, use: :slugged

  has_many :albums, dependent: :destroy
  has_many :songs, dependent: :destroy

  validates :nombre, presence: true

  def should_generate_new_friendly_id?
    nombre_changed?
  end
end
