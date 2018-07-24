class CreativePrompt::CLI

	def call
		puts "Creative Prompts for the Creatively Blocked"
		list_prompts
		choice
	end

	def list_prompts
		puts "Prompts organized by date:"

		@prompts = CreativePrompt::CPrompt.scrape_pnw.slice(0..19)
  	@prompts.each.with_index(1) do |prompt, i|
			puts "#{i}. #{prompt.date} - #{prompt.genre} - #{prompt.name}"
		end
	end

	def choice
		input = nil
    while input != "exit"
			puts "Please select a prompt from the list above, type list to reprint list of prompts, or type exit:"
			input = gets.strip.downcase

			if input.to_i > 0 && input.to_i <= @prompts.length
				the_prompt = @prompts[input.to_i-1]
				puts "#{the_prompt.name} - #{the_prompt.description}"
			elsif input == "list"
				list_prompts
      elsif input == "exit"
        adios
			else
				puts "Invalid entry, type list or exit"
			end
		end
	end

	def adios
		puts "Enjoy your creativity!"
	end

end
