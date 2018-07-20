class CreativePrompt::CPrompt
	attr_accessor :name, :date, :genre, :description, :url

	def initialize
		@date = date
		@name = name
		@genre = genre
		@description = description
		@url = url
	end


	def self.scrape_prompts
		prompts = []
		prompts << self.scrape_pnw
		prompts
	end

	def self.scrape_pnw
		doc = Nokogiri::HTML(open("https://www.pw.org/writing-prompts-exercises"))
		# list_doc = []
		# list_doc.collect.with_index do |element, i|
		# 	prompt = self.new
		# 	prompt.name = doc.search("h2.field-content")[i].text
		# 	prompt.date = doc.search("div.field-content.meta__date")[i].text
		# 	prompt.genre = doc.search("span.field-content a.active")[i].text
		# 	prompt.description = doc.search("div.field-content p")[i].text
		# 	prompt.url = doc.search("h2.field-content a")[i].attr("href")
		# 	prompt
		# end

		# doc.collect.with_index do |element, i|
		# 	prompt = self.new
		# 	prompt.name = element.search("h2.field-content")[i].text
		# 	prompt.date = element.search("div.field-content.meta__date")[i].text
		# 	prompt.genre = element.search("span.field-content a.active")[i].text
		# 	prompt.description = element.search("div.field-content p")[i].text
		# 	prompt.url = element.search("h2.field-content a")[i].attr("href")
		# 	prompt
		# 	# binding.pry
		# end

		prompt = self.new
		prompt.name = doc.search("h2.field-content")[0].text
		prompt.date = doc.search("div.field-content.meta__date")[0].text
		prompt.genre = doc.search("span.field-content a.active")[0].text
		prompt.description = doc.search("div.field-content p")[0].text
		prompt.url = doc.search("h2.field-content a").first.attr("href")
		prompt

	end

end
