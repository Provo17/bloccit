require 'random_data'
include RandomData 

 FactoryGirl.define do
   factory :vote do
     post
     topic
     user
     rank 0.0
   end
 end