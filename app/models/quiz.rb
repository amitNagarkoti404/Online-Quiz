class Quiz < ApplicationRecord
	has_many :questions, :dependent => :destroy
	has_many :submissions, :dependent => :destroy
	validates :name, presence: true, length: {minimum: 3, maximum: 30}
end