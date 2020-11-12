

def view_my_reviews
    system("clear")
  
    puts "My Reviews"
    sleep(0.5)
    rev = @user.reviews.reload
   
    if rev.empty?
      puts "You don't have any reviews saved yet!"
      puts "Choose a different option"
      self.user_menu
    else
      puts "Here are your reviews:"
      i = 1
      rev.each do |rev|
        puts "#{i}. #{rev.name}"
        i += 1
        sleep(1.0)
      end
      puts "Returning to main menu..."
      self.user_menu
    end
  end