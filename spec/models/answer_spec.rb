require 'rails_helper'

RSpec.describe Answer, type: :model do
    
  let(:question) { Question.create!(title: "New Post Title", body: "New Post Body", resolved: "Boolean Value") }
  
  let(:answer) { Answer.create!(body: 'Answer Body', question: question) }
 
   describe "attributes" do
     it "responds to body" do
       expect(answer).to respond_to(:body)
     end
   end
end
