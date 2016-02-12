class Course < ActiveRecord::Base
	ratyrate_rateable "difficulty", "workload", "enjoyment"
end
