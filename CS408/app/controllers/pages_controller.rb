class PagesController < ApplicationController

  def home
  end

  def contact
  end

  def privacypolicy
  end

  def results
  end
  
  def about
  end

 def Course_Profile
      @course = Course.find(params[:id])
      #@rev = Rate.where(rateable_id: params[:id]).select("review")      
      #@userreviews = @userprofile.userreviews.all
      #@userreview = @userprofile.userreviews.build
  end

end
