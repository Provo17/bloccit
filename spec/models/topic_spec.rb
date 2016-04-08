require 'rails_helper'
require 'random_data'
include RandomData

RSpec.describe Topic, type: :model do
  let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
 
    it { is_expected.to have_many(:posts) }
    it { is_expected.to have_many(:sponsored_posts) }
 
 # #1
   describe "attributes" do
     it "responds to name" do
       expect(topic).to respond_to(:name)
     end
 
     it "responds to description" do
       expect(topic).to respond_to(:description)
     end
 
     it "responds to public" do
       expect(topic).to respond_to(:public)
     end
 
 # #2
     it "is public by default" do
       expect(topic.public).to be(true)
     end
   end
end
