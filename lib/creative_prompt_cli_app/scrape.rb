class CreativePrompt::Scrape

  def self.scrape_pnw
		doc = Nokogiri::HTML(open("https://www.pw.org/writing-prompts-exercises"))
    # binding.pry

		doc.css(".view-content .views-row").each do |element|
      if element.css("h2.field-content").text != ""

        prompt = CreativePrompt::CPrompt.new
    		prompt.name = element.css("h2.field-content").text
    		prompt.date = element.css("div.field-content.meta__date").text
    		prompt.genre = element.css("span.field-content a.active").text
    		prompt.description = element.css("div.field-content p").text

      end
    end
	end

end
