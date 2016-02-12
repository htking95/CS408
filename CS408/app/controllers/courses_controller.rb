class CoursesController < ApplicationController

	def search
		if params[:search].present?
			@courses = Course.search(params[:search])
		else
			@courses = Course.all
		end
	end
end