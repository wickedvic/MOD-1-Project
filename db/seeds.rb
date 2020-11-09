User.destroy_all
Book.destroy_all
Review.destroy_all

vivek = User.create(username: "wickedvic", password: "1234")
beksultan = User.create(username: "beksultan", password: "123")
alfred = User.create(username: "alfredwang", password: "4321")

book1 = Book.create(author: "Dale Carnegie", title: "How to Win Friends and Influence People")
book2 = Book.create(author: "Noah Harari", title: "Sapiens")
book3 = Book.create(author: "Brian Tracy", title: "Eat That Frog!")
book4 = Book.create(author: "Hitler", title: "Mein Kampf")
book5 = Book.create(author: "J.K Rowling", title: "Harry Potter And The Creepy Professor")

Review.create(book_id: book1.id, user_id: vivek.id, review: "This was boring")
Review.create(book_id: book2.id, user_id: beksultan.id, review: "Interesting one")
Review.create(book_id: book3.id, user_id: alfred.id, review: "This was inspirational")
Review.create(book_id: book4.id, user_id: alfred.id, review: "Definitely recommend")
Review.create(book_id: book5.id, user_id: beksultan.id, review: "Save yourself the trouble")



