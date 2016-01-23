class Cantante < ActiveRecord::Base
	has_many :albums
	has_many :acordes

	validates :nombre, presence: true
end
