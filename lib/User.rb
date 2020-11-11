class User < ActiveRecord::Base
    has_many :reviews
    has_many :books, through: :reviews

    #def add_book(review)
        #Review.create(user_id: self.id, review_id: review.id, b: book.title)
    #end
    #binding.pry

end