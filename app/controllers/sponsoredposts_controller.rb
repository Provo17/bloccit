class SponsoredpostsController < ApplicationController
 
  def create
     @sponsoredpost = SponsoredPost.new
     @sponsoredpost.title = params[:sponsoredpost][:title]
     @sponsoredpost.body = params[:sponsoredpost][:body]
     @sponsoredpost.price = params[:sponsoredpost][:price]
     @topic = Topic.find(params[:topic_id])
     @sponsoredpost.topic = @topic
     
     if @sponsoredpost.save
       flash[:notice] = "Sponsored Post was saved."
       redirect_to [@topic, @sponsoredpost]
     else
       flash.now[:alert] = "There was an error saving the post. Please try again."
       render :new
     end
  end 
  
  def show 
    @sponsoredpost = Sponsoredpost.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @sponsoredpost = Sponsoredpost.new
  end

  def edit
    @sponsoredpost = Sponsoredpost.find(params[:id])
  end
end
  
