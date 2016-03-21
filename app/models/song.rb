class Song < ActiveRecord::Base
  include FriendlyId
  friendly_id :posible_slug, use: :slugged

  belongs_to :cantante
  belongs_to :album
  has_many :acordes, dependent: :destroy

  validates :nombre, presence: true

  def should_generate_new_friendly_id?
    nombre_changed?
  end

  def posible_slug
    [
      :nombre,
      [:nombre, self.album.nombre],
      [:nombre, self.album.nombre, self.album.cantante.nombre]
    ]
  end

end
