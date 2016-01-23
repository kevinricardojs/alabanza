class Acorde < ActiveRecord::Base
  belongs_to :cantante
  belongs_to :album

  validates :nombre, presence: true
  validates :acorde, presence: true
  validates :descripcion, presence: true
end
