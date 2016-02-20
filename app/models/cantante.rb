class Cantante < ActiveRecord::Base
	has_many :albums, dependent: :destroy
	has_many :songs, dependent: :destroy

	validates :nombre, presence: true
end
