class User < ActiveRecord::Base
    has_many :reviews
    has_many :books, through: :reviews

    #def add_book(review)
        #Review.create(user_id: self.id, review_id: review.id, b: book.title)
    #end
    #binding.pry
    #def delete_from_favorites(recipe)
       # snack_id_delete = FavoriteSnack.where(recipe_id: recipe.id, snacker_id: self.id).first.id
       # FavoriteSnack.destroy(snack_id_delete)
   # end
end