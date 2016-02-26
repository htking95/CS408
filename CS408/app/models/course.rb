class Course < ActiveRecord::Base
	has_many :reviews

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
