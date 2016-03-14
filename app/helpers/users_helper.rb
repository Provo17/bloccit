module UsersHelper
    def user_has_posts(post)
        user.post if user && user.post.present?
    end
    
    def user_has_comments(comment)
        user.comment. if user && user.comment.present?
    end
end
