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

	def average_rate
	    ratings = Rate.where(rateable_id: self.id)
	    total = 0
	    count = 0
	    ratings.each do |rate|
	      total = total + rate.stars
	      count = count + 1
	    end

	    if count != 0
	      return total/count
	    else
	      return 0
	    end
	end

end
