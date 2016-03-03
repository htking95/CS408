class Review < ActiveRecord::Base
	belongs_to :user
	belongs_to :course
	acts_as_votable

	def scoreReview
    	self.get_upvotes.size - self.get_downvotes.size
  	end

  	def scoreFunny
  		self.find_votes_for(:vote_scope => 'funny').size
  	end
end
