class Course < ActiveRecord::Base
	has_many :reviews
	has_many :questions
	has_many :answers

	searchkick word_start: [:courseNum, :name, :department]
	def search_data
		{
			courseNum: courseNum,
			name: name,
			department: department
		}
	end

	ratyrate_rateable "difficulty", "workload", "enjoyment"

end
