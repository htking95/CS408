class Question < ActiveRecord::Base
	belongs_to :course
	has_many :answers

end
