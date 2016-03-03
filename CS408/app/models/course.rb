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
