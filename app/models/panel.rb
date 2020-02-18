class Panel < ApplicationRecord
	has_many :items
	belongs_to :group
	belongs_to :proface
	has_many :ipcs
end
