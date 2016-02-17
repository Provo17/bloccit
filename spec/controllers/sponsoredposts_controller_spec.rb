require 'rails_helper'
require 'random_data'
include RandomData

RSpec.describe SponsoredpostsController, type: :controller do
    
  let(:my_topic) { Topic.create!(name:  RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:my_sponsoredpost) { my_topic.sponsoredposts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }

  describe "GET show" do
     it "returns http success" do
        get :show, topic_id: my_topic.id, id: my_sponsoredpost.id
       expect(response).to have_http_status(:success)
     end
 
     it "renders the #show view" do
       get :show, {id: my_sponsoredpost.id}
       expect(response).to render_template :show
     end
 
     it "assigns my_sponsoredpost to @sponsoredpost" do
       get :show, {id: my_sponsoredpost.id}
       expect(assigns(:topic)).to eq(my_sponsoredpost)
     end
   end

  describe "GET new" do
     it "returns http success" do
       get :new
       expect(response).to have_http_status(:success)
     end
 
     it "renders the #new view" do
       get :new
       expect(response).to render_template :new
     end
 
     it "initializes @sponsoredpost" do
       get :new
       expect(assigns(:sponsoredpost)).not_to be_nil
     end
   end

  describe "GET edit" do
     it "returns http success" do
       get :edit, {id: sponsoredpost.id}
       expect(response).to have_http_status(:success)
     end
 
     it "renders the #edit view" do
       get :edit, {id: my_sponsoredpost.id}
       expect(response).to render_template :edit
     end
 
     it "assigns topic to be updated to @topic" do
       get :edit, {id: my_sponsoredpost.id}
       topic_instance = assigns(:sponsoredpost)
 
       expect(topic_instance.id).to eq my_sponsoredpost.id
       expect(topic_instance.name).to eq my_sponsoredpost.name
       expect(topic_instance.description).to eq my_sponsoredpost.description
     end
   end
end
