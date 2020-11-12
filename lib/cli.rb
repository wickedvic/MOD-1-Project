require 'pry'
require 'tty-prompt'
class CLI
    attr_accessor :user, :review, :book

    def start
        welcome
        CLI.menu
    end
    
    
    def welcome
        system("clear")
        
        puts "Welcome back!"
        sleep(0.5)

        puts "Bookworm"
    end
   
    def self.menu
        prompt = TTY::Prompt.new
        sleep(1)
        display_menu = prompt.select ("Welcome to bookworm ") do |menu|
            menu.choice "Returning bookworm"
            menu.choice "First book"
            menu.choice "Exit"
        end
        if display_menu == "Returning bookworm"
            system("clear")
            CLI.login
        elsif display_menu == "First book"
            system("clear")
            CLI.create_account
        elsif display_menu == "Exit"
            exit!
        end
    end

    def self.create_account
        prompt = TTY::Prompt.new
        username = prompt.ask("What is the users name ?")
        password = prompt.mask("Please enter a password")
        
        guest = User.create(username: username, password: password)
        puts "Welcome to the bookworm club!"
        sleep(1)
        @user = User.all.find_by(username: username.downcase! , password: password)
        @user
        CLI.user_menu 
    end
    
    
    def self.login
        prompt = TTY::Prompt.new
        username = prompt.ask("What is your user name?")
        password = prompt.mask("password")
        
        if User.find_by(username: username, password: password)
            @user = user.find_by(username: username, password: password)
            @user
         CLI.user_menu
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
             CLI.login
         elsif wrong_password == "Create an Account"
             system("clear")
             CLI.create_account
         end


         def self.exit
            prompt = TTY::Prompt.new
            @user = nil
            sleep(1.0)
            puts "Thank you ."
            prompt.keypress("\nPress q to return to main menu.", keys: [:"q", :return])
            CLI.menu
        end
    end

     # menu after log in
     def self.user_menu
        
        prompt = TTY::Prompt.new
        puts "Welcome back !!!"
       
        select = prompt.select("What would you like to do?") do |menu|
            menu.choice 'Wrtie a review' 
            menu.choice 'Update a review' 
            menu.choice 'Delete review'
            menu.choice 'View Reviews'
            menu.choice 'Exit'
            
        
        #  if select == "Wrtie a review"
        #     add_review
        # elsif select == 'Update a review'
        #     update_review
        #  elsif   select  == 'Delete a review'
        #     puts "will delete the review "
        #     delete_review
        # else
        if select == 'View Reviews'
        puts "here are your reviews"
            view_my_reviews
        # elsif select == "Exit"
        #     system("clear")
        #     exit!
            
         end
    end
end

  


    

end #end of class

