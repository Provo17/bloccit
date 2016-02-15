class SponsoredpostsController < ApplicationController
  
  def create
 # #9
     @sponsoredpost = SponsoredPost.new
     @showpost.title = params[:showpost][:title]
     @showpost.body = params[:showpost][:body]
     @topic = Topic.find(params[:topic_id])
     @showpost.topic = @topic

 # #10
     if @sponsoredpost.save
 # #11
       flash[:notice] = " Sponsored Post was saved."
       redirect_to [@topic, @sponsoredpost]
     else
 # #12
       flash.now[:alert] = "There was an error saving the sponsored post. Please try again."
       render :new
     end
  end
  
  def show 
    @sponsoredpost = SponsoredPost.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @sponsoredpost = SponsoredPost.new
  end

  def edit
    @sponsoredpost = SponsoredPost.find(params[:id])
  end
  
  def update
     @sponsoredpost = SponsoredPost.find(params[:id])
     @sponsoredpost.title = params[:sponsoredpost][:title]
     @sponsoredpost.body = params[:sponsoredpost][:body]
 
     if @sponsoredpost.save
       flash[:notice] = "Sponsored Post was updated."
       redirect_to [@topic, @sponsoredpost]
     else
       flash.now[:alert] = "There was an error saving the post. Please try again."
       render :edit
     end
  end
  
  def destroy
     @sponsoredpost = SponsoredPost.find(params[:id])
 
 # #8
     if @sponsoredpost.destroy
       flash[:notice] = "\"#{@sponsoredpost.title}\" was deleted successfully."
       redirect_to @sponsoredpost.topic
     else
       flash.now[:alert] = "There was an error deleting the post."
       render :show
     end
  end
end
