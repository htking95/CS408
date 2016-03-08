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

	def averageGrade
		total = 0
		puts "Begining of average Grade func"
		count = 0
		if self.reviews == nil then
			return nil
		end
		self.reviews.each do |r|
			puts "Looping through reviews"
			puts r.GradeReceived
			if !(r.GradeReceived == nil) then
				count = count + 1
				total = total + r.GradeReceived
			end
		end

		if count == 0 then
			return nil
		end
		
		avgG = total/count
		puts "avg"
		puts avgG
		
		case avgG
      	when 1
        	return 'A'
      	when 2
        	return 'B'
      	when 3
        	return 'C'
      	when 4
        	return 'D'
      	when 5
        	return 'F'
      	end
	end	

end
