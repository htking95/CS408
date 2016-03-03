class Course < ActiveRecord::Base
	has_many :reviews

	searchkick word_start: [:courseNum, :name, :department, :fullName]
	
	# this tells searchkick what data to index for searching
	def search_data
		{
			courseNum: courseNum,
			name: name,
			department: department,
			fullName: fullName
		}
	end

	ratyrate_rateable "difficulty", "workload", "enjoyment"

end
