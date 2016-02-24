# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require "random_data"
 # Create Posts
 50.times do
 # #1
   Post.create!(
 # #2
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end
 post = Post.all
 
 # Create Comments
 # #3
 100.times do
   Comment.create!(

     post: post.sample,
     body: RandomData.random_paragraph
   )
 end
 
 10.times do
  
  Comment.create!
   
   post.find_or_create_by(title: "LOOK AT ME!", body: "I'm being looked at!")
   Comment.find_or_create_by(body: "WHEEEEEEEEEEEEE!!!!")
 end 
 
 
 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"