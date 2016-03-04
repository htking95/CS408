class Course < ActiveRecord::Base
	has_many :reviews
	has_many :questions
	has_many :answers

	searchkick word_start: [:courseNum, :name, :department, :fullName, :departmentFull]
	
	# this tells searchkick what data to index for searching
	def search_data
		{
			courseNum: courseNum,
			name: name,
			department: department,
			fullName: fullName,
			departmentFull: departmentFull
		}
	end

	ratyrate_rateable "difficulty", "workload", "enjoyment"

end
