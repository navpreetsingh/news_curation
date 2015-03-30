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
	end
end