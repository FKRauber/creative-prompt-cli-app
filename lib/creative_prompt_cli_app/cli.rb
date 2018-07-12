#CLI controller
class CreativePrompt::CLI

	def call
		puts "Creative Prompts for the Creatively Blocked"
		list_prompts
		choice
		adios
	end


	def list_prompts
		puts "Prompts organized by date:"
		# FAKE LIST UNTIL SCRAPER SET UP
		# GSUB LINE REMOVES SPACE PRECEDING EACH ITEM
		#  puts <<-DOC.gsub /^\s*/, ''
		#  	1. 09-July-2018 - Fiction - Sea Change
		#  	2. 08-July-2018 - Poetry - Travel Verse
		#  	3. 07-July-2018 - Creative Nonfiction - Procrasti-what?
		#  DOC

		# SCRAPE CODE
		@prompts = CreativePrompt::CPrompt.scrape_prompts
		@prompts.each.with_index(1) do |prompt, i|
			puts "#{i}. #{prompt.date} - #{prompt.name} - #{prompt.genre}"
		end
	end

	def choice
		input = nil
		while input != "exit"
			puts "Please select a prompt from the list above, type list to reprint list of prompts, or type exit:"
			input = gets.strip.downcase
      case input
      when "1"
        puts "No. 1"
      when "2"
        puts "No. 2"
      when "3"
        puts "No. 3"
      else
        puts "nil"
      end

			# if input.to_i > 0
			# 	the_prompt = @prompts[input.to_i-1]
			# 	puts "#{the_prompt.date} - #{the_prompt.name} - #{the_prompt.genre}"
			# elsif input == "list"
			# 	list_prompts
			# else
			# 	puts "Invalid entry, type list or exit"
			# end
		end
	end

	def adios
		puts "Enjoy your creativity!"
	end

end
