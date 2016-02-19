class CoursesController < ApplicationController
	respond_to :html, :json
	def index
		@courses = Course.all
	end

	def show
		@course = Course.find(params[:id])
		@reviews = Review.where(course_id: @course.id)
	end

	def new
		@course = Course.new
	end
		
	def course_params
		params.require(:course).permit(:description)
	end

	def update
		@course = Course.find(params[:id])
    	@course.update(course_params)
    	respond_with @course
		#respond_to do |format|
		#	if @course.update(params(:course => :description))
		#		format.html { redirect_to @course, notice: "Descrption was successfully updated. Who did that? DEEZ NUTZ HAH GOTEM HAHA HAHAHA HAHAHA"}
		#		format.json { respond_with_bip(@course)}
		#	else
		#		format.html { render actions: 'edit' }
		#		format.json { respond_with_bip(@course) }
		#	end
		#end
	end

	def search
		if params[:search].present?
			@courses = Course.search(params[:search])
		else
			@courses = Course.all
		end
	end
end

