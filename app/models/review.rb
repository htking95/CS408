class Review < ActiveRecord::Base
	belongs_to :user
	belongs_to :course
	acts_as_votable
  mount_uploader :syllabus, SyllabusUploader

	def scoreReview
    	self.get_upvotes.size - self.get_downvotes.size
  	end

  	def scoreFunny
  		self.find_votes_for(:vote_scope => 'funny').size
  	end

  	def scoreFlag
  		self.find_votes_for(:vote_scope => 'flag').size
  	end
end
