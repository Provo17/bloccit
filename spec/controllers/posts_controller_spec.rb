require 'rails_helper'
require "random_data"
include RandomData

RSpec.describe PostsController, type: :controller do
 # #12
let(:my_topic) { Topic.create!(name:  RandomData.random_sentence, description: RandomData.random_paragraph) }
let(:my_post) { my_topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }


describe "GET show" do
    
     it "returns http success" do
       get :show, topic_id: my_topic.id, id: my_post.id
       expect(response).to have_http_status(:success)
     end
     
     it "renders the #show view" do
       get :show, topic_id: my_topic.id, id: my_post.id
       expect(response).to render_template :show
     end
 
     it "assigns my_post to @post" do
       get :show, topic_id: my_topic.id, id: my_post.id
       expect(assigns(:post)).to eq(my_post)
     end
   end

    describe "GET new" do
        
      it "returns http success" do
        get :new, topic_id: my_topic.id
        expect(response).to have_http_status(:success)
      end
      it "renders the #new view" do
        get :new, topic_id: my_topic.id
        expect(response).to render_template :new
      end
      it "instantiates @post" do
        get :new, topic_id: my_topic.id
        expect(assigns(:post)).not_to be_nil
      end
    end

    describe "GET edit" do
        
     it "returns http success" do
       get :edit, topic_id: my_topic.id, id: my_post.id
       expect(response).to have_http_status(:success)
     end
 
     it "renders the #edit view" do
       get :edit, topic_id: my_topic.id, id: my_post.id
       expect(response).to render_template :edit
     end
     it "assigns post to be updated to @post" do
       get :edit, topic_id: my_topic.id, id: my_post.id
 
       post_instance = assigns(:post)
 
       expect(post_instance.id).to eq my_post.id
       expect(post_instance.title).to eq my_post.title
       expect(post_instance.body).to eq my_post.body
     end
   end
end
