# PHASE 2
def convert_to_int(str) 
  #FIRST PART HERE, ADD NO ERROR RAISED ON INVALID INPUT? RETURN NIL ON ERROR
  begin
  Integer(str)
  rescue ArgumentError
    return nil 
  end
end
# p convert_to_int('a') #catches ArgumentError

# PHASE 3
FRUITS = ["apple", "banana", "orange"]
class Coffee < StandardError 
end

class NotCoffee < StandardError 
end

def reaction(maybe_fruit) #Raises error if not fruit, can only try again if it was given coffee
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit.downcase == "coffee"
    raise Coffee
  else
    raise NotCoffee 
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  begin 
  maybe_fruit = gets.chomp
  reaction(maybe_fruit) 
  rescue Coffee
    puts "I don't want coffee"  #catch error, make condtional input, retry if maybe_fruit was coffee
    retry
  rescue NotCoffee
    puts "I don't want that goodbye"
  end  
end
# p feed_me_a_fruit

# PHASE 4
class BestFriendError < StandardError ; end 
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
  rescue
    @yrs_known = yrs_known
    
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


