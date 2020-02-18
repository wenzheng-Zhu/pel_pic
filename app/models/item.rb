class Item < ApplicationRecord
	has_many :ipcs
	has_many :pics
	has_many :words
	belongs_to :panel
end
