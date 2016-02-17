require 'rails_helper'
require 'random_data'
include RandomData

RSpec.describe SponsoredPost, type: :model do
  
  let(:my_topic) { Topic.create!(name:  RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:my_sponsoredpost) { my_topic.sponsoredposts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }
  
 describe "attributes" do
     it "responds to title" do
       expect(my_sponsoredpost).to respond_to(:title)
     end
 
     it "responds to body" do
       expect(my_sponsoredpost).to respond_to(:body)
     end
 
     it "responds to price" do
       expect(my_sponsoredpost).to respond_to(:price)
     end
   end
end
