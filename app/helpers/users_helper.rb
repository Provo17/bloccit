module UsersHelper
	def has_posts_or_comments?(user)
		puts "calling has_posts_or_comments?"
		puts "counts"
		puts user.comments
		puts user.posts
		if user.comments.count + user.posts.count == 0 then
			puts "User has no posts or comments"
			return "User has no posts or comments"
		end
	end    
end
