class Content < ApplicationRecord
	belongs_to :user
	paginates_per 20
end


