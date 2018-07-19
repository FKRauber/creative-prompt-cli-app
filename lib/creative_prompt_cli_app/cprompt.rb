class CreativePrompt::CPrompt
	attr_accessor :name, :date, :genre, :description, :url



	def self.scrape_prompts

		prompts = []

		prompts << self.scrape_pnw

		prompts

		# FAKE LIST UNTIL SCRAPE SET UP
		# prompt_1 = self.new
		# prompt_1.name = "Sea Change"
		# prompt_1.date = "09-July-18"
		# prompt_1.genre = "Fiction"
		# prompt_1.description = "Description of prompt 1..."
		# prompt_1.url = "https://www.pw.org/content/sea_change_0"
    #
		# prompt_2 = self.new
		# prompt_2.name = "Travel Verse"
		# prompt_2.date = "08-July-18"
		# prompt_2.genre = "Poetry"
		# prompt_2.description = "Description of prompt 2..."
		# prompt_2.url = "https://www.pw.org/content/travel_verse"
    #
		# prompt_3 = self.new
		# prompt_3.name = "Procrasti-what?"
		# prompt_3.date = "07-July-18"
		# prompt_3.genre = "Creative Nonfiction"
		# prompt_3.description = "Description of prompt 3..."
		# prompt_3.url = "https://www.pw.org/content/procrastiwhat"
	end

	def self.scrape_pnw
		doc = Nokogiri::HTML(open("https://www.pw.org/writing-prompts-exercises"))
		# puts doc.class
		# puts doc.css("h2.field-content").text
		# puts doc.css("div.field-content.meta__date").text
		# puts doc.css("span.field-content a.active").text
		# puts doc.css("div.field-content p").text
		# puts doc.css("h2.field-content a").first.attr("href")
		# binding.pry

		#doc.each do |element|
		prompt = self.new
		prompt.name = doc.search("h2.field-content")[0].text
		prompt.date = doc.search("div.field-content.meta__date")[0].text
		prompt.genre = doc.search("span.field-content a.active")[0].text
		prompt.description = doc.search("div.field-content p")[0].text
		prompt.url = doc.search("h2.field-content a").first.attr("href")
		prompt
		#end
	end

end
