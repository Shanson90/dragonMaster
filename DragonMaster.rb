#Shit left to do:
#Dragon should wake up after passage of time
#All methods should fail while drag is asleep
#Add "wake" method






system 'cls'
puts 'Hello, and welcome to DragonMaster'
puts 'This program trains you to care for your own dragon'
puts 'so that you\'re ready when you get one in real life!'
puts
class Dragon
	def initialize
		@food = 5
		@poop = 5
		@play = 5
		@sleep = 5
		@age = 0
		@asleep = false
		puts 'A dragon has been born.'
		puts 'What shall you call him?'
		@name = gets.chomp
	end
	
	#Food Methods
	def feed
		puts 'How much do you want to feed '+ @name
		puts '(Enter any number from 1-10)'
		@feed = gets.chomp.to_i
		@food +=  @feed
		if @food > 10
			@food = 10
		else
			
		end
		puts 'You fed ' + @name + 'a small goat. and '
		puts @name + ' loved it!'
		if @food < 10
			puts @name + ' is still hungry.'
		elsif @food >= 10
			puts @name + ' is full.'
		end
	end

	def full?
		if @food >= 10
			puts @name + ' is full.'
		else
			puts @name + ' is hungry.'
		end	
	end
	
	#Poop Methods
	def poop
		if @poop >= 7
			puts @name + ' pooped.'
			@poop = 0
		else
			puts @name + ' doesn\'t need to poop'
		end
	end

	def needsToPoop?
		if @poop >= 7
			puts @name + ' needs to poop.'
		else
			puts @name + ' doesn\'t need to poop.'	
		end
	end
	
	#Play Methods
	def play
		play = 'y'
		while ((@play < 10) and (play == 'y'))
			puts @name + ' wants to play catch.'
			puts 'Throw the stick? (y/n)'
			play = gets.chomp
			if play == 'y'
				@play += 1
				puts 'You threw the stick!'
				puts '... and ' + @name + ' brought it back!'
			else
				puts 'Ok, but ' + @name + ' needs to play soon!'
			end
		end
	end
	
	def play?
		if @play <= 5
			puts @name + ' needs to play.'
		else
			puts @name + ' doesn\'t want to play.'
		end
	end

	#Sleep Methods
	def asleep?
		if @asleep == true
			puts	
			puts @name + ' is sleeping. Shhhh...'
		else
			puts
			puts @name + ' is awake!'
		end
	end

	def sleepy?
		if @sleep < 3
			puts @name + ' is sleepy.'
			puts 'Would you like to put him to sleep? (y/n)'
			ans = gets.chomp
			if ans == 'y'
				drag.sleep
			else
				puts 'Ok, but don\'t deprive ' + @name + ' of sleep!'
				puts 'Dragons can die from lack of sleep...'
			end
		else
			puts @name + ' isn\'t sleepy.'
		end
	end

	def sleep
		if @sleep < 3
			@asleep = true
			puts
			puts 'Rock-a-bye dragon, in the treetop'
			puts 'When the wind blows, the branches will rock'
			puts 'When the bough breaks, the dragon will fall'
			puts 'And up will go dragon, he can fly after all!'		
			puts
			puts @name + ' fell asleep.'	
		else
			puts @name + ' isn\'t sleepy.'
		end	
	end

	#Time Methods
	def timePasses
		@poop += 1
		@food -= 1
		@play -= 1
		@sleep -= 1 
	end
end
drag = Dragon.new
#Dragon now has a name


def chooser(action , aDragon)
	if action == 1
		aDragon.full?
	elsif action == 2
		aDragon.feed
	elsif action == 3
		aDragon.needsToPoop?
	elsif action == 4
		aDragon.poop
	elsif action == 5
		aDragon.play?
	elsif action == 6
		aDragon.play
	elsif action == 7
		aDragon.sleepy?
	elsif action == 8
		aDragon.sleep
	elsif action == 9
		exit
	else
		puts 'Sorry, that\'s not a valid command.'
		puts 'Enter a command number (1-9)'
		action = gets.chomp.to_i
	end
end	

def shortPrompt
	puts
	puts 'Available Commands:'
	puts 'Hungry?       (1)'
	puts 'Feed          (2)'
	puts 'Need to Poop? (3)'
	puts 'Take out      (4)'
	puts 'Want to play? (5)'
	puts 'Play          (6)'
	puts 'Sleepy?       (7)'
	puts 'Put to sleep  (8)'
	puts 'Exit Program  (9)'
	puts
end

def longPrompt
	puts
	puts 'What would you like to do?'
	puts 'You can check if your Dragon is hungry (simply enter 1)'
	puts 'Or feed him (2)'
	puts 'See if he needs to poop (3)'
	puts 'Take him out to go to the bathroom (4) or just play with him (6)'
	puts 'that is, if he wants to play... (5 to check) he\'s a dragon'
	puts 'afterall. You can\'t really force him to do anything.'
	puts 'You can check to see if he\'s sleepy (7)'	
	puts 'or put him to sleep (8)'
	puts 'So what will it be?'
	puts
end

quit = 1	
longPrompt
act = gets.chomp.to_i
while quit != 0
	chooser(act, drag)
	shortPrompt
	act = gets.chomp.to_i
	if (quit / 4) == 1
		drag.timePasses
		quit = 1
	end
	quit += 1
end

