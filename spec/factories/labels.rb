require 'random_data'
include RandomData 

 FactoryGirl.define do
   factory :label do
     body RandomData.random_sentence
     post
     topic
   end
 end