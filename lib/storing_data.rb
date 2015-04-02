class StoringData
	class << self

		def csv_data
			News.connection
			file = File.read(Rails.root + "lib/news.csv").split("\n")
      		file.each do |fs|
      			second_split = fs.split("\",\"")
      			News.create(headline: second_split[0].gsub("\"",""), url: second_split[1], ready: second_split[2].to_s, description: Nokogiri::HTML(second_split[3].gsub("\"\"", "\"")[0..-2]).text.underscore.humanize)
      		end
		end

    def keywords_count      
      news = News.all.select("headline, ready, description")
      news.each do |n|        
        ready = n.ready

        keyword = Hash.new(0)        
        headline = n.headline
        headline = headline.split(/[^a-zA-Z]/)
        headline.delete("")
        headline.each {|h_key| keyword[h_key.downcase] += 1}
        storing_keywords(keyword, ready)

        keyword = Hash.new(0)
        description = n.description
        description = description.split(/[^a-zA-Z]/)
        description.delete("")        
        description.each {|d_key| keyword[d_key.downcase] += 1}
        storing_keywords(keyword, ready, "description")
      end
    end

    def storing_keywords(keywords, ready, head = "headline")
      keys = keywords.keys  
      keys.each do |key|
        count = keywords[key]
        table = count < 3  ? (head.first + count.to_s + (ready == 0 ? "b" : "r")).to_sym : (head.first + "g3" + (ready == 0 ? "b" : "r")).to_sym
        keyword = Keywords.where(name: key).first_or_create.increment(table).increment!(:total, count)
      end
    end
       
	end
end