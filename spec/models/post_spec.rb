require 'rails_helper'
require 'random_data'
include RandomData

RSpec.describe Post, type: :model do

# #3
   let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
 # #4
   let(:post) { topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }
 
   it { is_expected.to belong_to(:topic) }
   
   it { is_expected.to validate_presence_of(:title) }
   it { is_expected.to validate_presence_of(:body) }
   it { is_expected.to validate_presence_of(:topic) }
 
   it { is_expected.to validate_length_of(:title).is_at_least(5) }
   it { is_expected.to validate_length_of(:body).is_at_least(20) }

 
   describe "attributes" do
 # #2
     it "responds to title" do
       expect(post).to respond_to(:title)
     end
 # #3
     it "responds to body" do
       expect(post).to respond_to(:body)
     end
   end
end
