class Answer < ActiveRecord::Base
	belongs_to :question
	belongs_to :course
	acts_as_votable

	def scoreAnswer
    	self.get_upvotes.size - self.get_downvotes.size
  	end

  	def scoreFlag
  		self.find_votes_for(:vote_scope => 'flag').size
  	end
end
