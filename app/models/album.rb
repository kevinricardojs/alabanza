class Album < ActiveRecord::Base
  include FriendlyId
  friendly_id :posible_slug, use: :slugged

  belongs_to :cantante
  has_many :songs, dependent: :destroy

  validates :nombre, presence: true
  validates :year, presence: true

  def should_generate_new_friendly_id?
    nombre_changed?
  end

  def posible_slug
    [
      :nombre,
      [:nombre, :year],
      [:nombre, :year, self.cantante.nombre]
    ]
  end
end
