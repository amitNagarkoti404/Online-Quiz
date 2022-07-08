class Option < ApplicationRecord
	belongs_to :question
	validates :opt_name, presence: true, length: {minimum: 1}
end