class Pelco < ApplicationRecord

	validates :ip, presence: true, uniqueness: true
	validates :camera_name, presence: true
	
end
