class StoringData
	class << self

		def csv_data      
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

    def useless_keywords
      useless_words = ["the", "and", "to", "a", "of", "in", "s", "for", "on", "is", "as", "it", "that", "you", "with", "your", "has", "from", "are", "at", "its", "be", "this", "will", "can", "by", "have", "about", "inc", "an", "t", "not", "how", "up", "which" "i", "all", "also", "but", "their", "was", "when", "now", "or", "they", "use", "if", "what", "we", "other", "he", "m", "daily", "like", "out", "into", "most", "been", "do", "his", "after", "just", "last"]
      useless_words.each do |uw|
        k = Keywords.find_by_name(uw)
        k.destroy unless k.nil?
      end
    end

    def major_keywords_count
      keywords = Keywords.select(:id, :name).order(total: :desc).limit(30)
      news = News.select(:id, :headline, :ready, :description)
      keywords.each do |k|
        news.each do |n|
          n_count, n_pos, d_count, d_pos = 0, [], 0, []

          headline = n.headline
          headline = headline.split(/[^a-zA-Z]/)
          headline.delete("")
          headline = headline.map{|k| k.downcase}
          n_count = headline.count(k.name)
          (1..n_count).each do |c|
            n_pos << (headline.index(k.name) - 1 + c)
            headline.delete_at(n_pos.last)
          end

          description = n.description
          description = description.split(/[^a-zA-Z]/)
          description.delete("") 
          description = description.map{|k| k.downcase}
          d_count = description.count(k.name)
          (1..d_count).each do |c|
            d_pos << (description.index(k.name) - 1 + c)
            description.delete_at(d_pos.last)
          end          
          NewsKeyword.create(keyword_id: k.id, news_id: n.id, head_count: n_count, keyword_head_position: n_pos.join(","), desc_count: d_count, keyword_desc_position: d_pos.join(","), ready: n.ready)
        end
      end
    end
       
	end
end