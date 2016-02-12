class Course < ActiveRecord::Base
	searchkick word_start: [:courseNum, :name, :department]
	def search_data
		{
			courseNum: courseNum,
			name: name,
			department: department
		}
	end
end
