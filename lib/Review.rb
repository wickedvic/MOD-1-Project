class Review < ActiveRecord::Base
    
    belongs_to :users
    belongs_to :books
    

    def update_review(book, user, new_review_body)
        
        review_to_update = Review.find_by(book_id: book.id, user_id: user.id)
        review_to_update.update(review: new_review_body)
        puts "Review updated"
    end
    
    
    def add_review(book, user, review_body)
        raise "No books found" unless book.present? && user.present? 
        Review.create(user_id: user.id, book_id: book.id, review: review_body)
        puts "Review created"
    end

    

end