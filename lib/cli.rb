require 'pry'
require 'tty-prompt'
class CLI
    attr_accessor :user, :review, :book
    def initialize
        @current_user = nil
        @current_book = nil
        @current_review = nil
    end

    def start
        welcome
        self.menu
    end
    
    
    def welcome
        system("clear")
        
        puts "Welcome"
        sleep(0.5)

        puts "Bookworm"
    end
   
    def menu
        prompt = TTY::Prompt.new
        sleep(1)
        display_menu = prompt.select ("Welcome to bookworm ") do |menu|
            menu.choice "Returning bookworm"
            menu.choice "First book"
            menu.choice "Exit"
        end
        if display_menu == "Returning bookworm"
            system("clear")
            self.login
        elsif display_menu == "First book"
            system("clear")
            self.create_account
        elsif display_menu == "Exit"
            exit!
        end
    end

    def create_account
        prompt = TTY::Prompt.new
        username = prompt.ask("What is the users name ?")
        password = prompt.mask("Please enter a password")
        
        guest = User.create(username: username, password: password)
        puts "Welcome to the bookworm club!"
        sleep(1)
        @user = User.all.find_by(username: username.downcase! , password: password)
        @user
        user_menu 
    end
    
    
    def login
        prompt = TTY::Prompt.new
        username = prompt.ask("What is your user name?")
        password = prompt.mask("password")
        
        if User.find_by(username: username, password: password)
            @user = User.find_by(username: username, password: password)
            @user
            @current_user = @user
            pick_book
        elsif
            system("clear")
            wrong_password = prompt.select("Username or Password not found.") do |menu|
                menu.choice "Log In"
                menu.choice "Create an Account"
                system("clear")
            end
         end 
         if wrong_password == "Log In"
             system("clear")
             login
         elsif wrong_password == "Create an Account"
             system("clear")
             create_account
         end
    end

    def exit
        prompt = TTY::Prompt.new
        @user = nil
        sleep(1.0)
        puts "Thank you ."
        prompt.keypress("\nPress q to return to main menu.", keys: [:"q", :return])
        self.menu
    end
    
    def view_reviews
        prompt = TTY::Prompt.new
        all_reviews = Review.all
        selected_review = prompt.select("Select a review") do |menu|
            all_reviews.each do |rev|
                menu.choice rev.review
            end
        end
        @current_review = Review.find_by(review: selected_review)
        user_menu
    end
    
    
    
    
    
    def pick_book
        prompt = TTY::Prompt.new
        all_books = Book.all
        book_title = prompt.select("Select a book") do |menu|
            all_books.each do |book|
                menu.choice book.title
            end
        end
        @current_book = Book.find_by(title: book_title)
        user_menu
    end

     # menu after log in
     def user_menu
        
        prompt = TTY::Prompt.new
        puts "Welcome back !!!"
       
        select = prompt.select("What would you like to do?") do |menu|
            menu.choice 'Write a review' 
            menu.choice 'Update a review' 
            menu.choice 'Delete review'
            menu.choice 'View Reviews'
            menu.choice 'Exit'
        end
        
         if select == "Write a review"
            prompt = TTY::Prompt.new
            review_body= prompt.ask("write a review for this book")
           
           # review_body = "Amazing book to read"
            Review.new.add_review(@current_book, @current_user, review_body)
        elsif select == 'Update a review'
            prompt = TTY::Prompt.new
            new_review_body= prompt.ask("update your review")    
             #new_review_body = "I changed my mind"
            Review.new.update_review(@current_book, @current_user, new_review_body)
            
         elsif   select  == 'Delete a review'
           if @current_review.present? 
                puts "will delete the review "
                delete_review(@current_review)
            else
                puts "Select a review to delete"
                view_reviews #selects the review for deletion
                binding.pry
                delete_review(@current_review) 
            end
        end
        
        if select == 'View Reviews'
         puts "here are all the reviews"
            view_reviews
        # elsif select == "Exit"
        #     system("clear")
        #     exit!
        end
    end
        
    # def view_my_reviews
    #     system("clear")
    #     #binding.pry
    #     puts "My Reviews"
    #     sleep(0.5)
    #     #rev = @user.reviews.reload
    #     rev=Review.where(user_id: @user)
       
    #     if rev.empty?
    #         puts "You don't have any reviews saved yet!"
    #         puts "Choose a different option"
    #         self.user_menu
    #     else
    #         puts "Here are your reviews:"
    #         i = 1
    #         rev.each do |rev|
    #             puts "#{i}. #{rev.name}"
    #            i += 1
    #             sleep(1.0)
    #         end
    #         puts "Returning to main menu..."
    #         self.user_menu
    #     end
    #end
end #end of class

