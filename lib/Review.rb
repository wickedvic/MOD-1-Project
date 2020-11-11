class Review < ActiveRecord::Base
    belongs_to :users
    belongs_to :books
end


# def add_review(review)
#     Review.create(user_id: user.id, book_id: book.id, review_id: self.id)
# end

# def delete_review(review)
#     review_delete = Review.where(review_id: self.id, user_id: user.id).first.id
#     Review.destroy(review_delete)
# end