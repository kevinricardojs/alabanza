class Cantante < ActiveRecord::Base
	has_many :albums, dependent: :destroy
	has_many :acordes, dependent: :destroy

	validates :nombre, presence: true
end
