class NewsController < ApplicationController
  def view
  	@news = News.all  	
  end

  def analysis1
  	@keywords = Keywords.where("total > 10").order(total: :desc)
  end

  def analysis2
  	@imp_key1 = NewsKeyword.select("keyword_id, keywords.name as name, head_count, desc_count, ready_sign, count(ready_sign) as rs").joins("INNER JOIN keywords on keywords.id = news_keywords.keyword_id").where("desc_count < 4").group("ready_sign, head_count, desc_count, keyword_id")
  	@imp_key2 = NewsKeyword.select("keyword_id, keywords.name as name, head_count, desc_count, ready_sign, count(ready_sign) as rs").joins("INNER JOIN keywords on keywords.id = news_keywords.keyword_id").where("desc_count >= 4").group("ready_sign, keyword_id")
  	@keys = Keywords.order(total: :desc).limit(30).pluck(:id)

  end

  def analysis3

  end

  def analysis4

  end

  def analysis5

  end

  def make_db
  	require 'storing_data'
  	StoringData.csv_data
  	StoringData.keywords_count
  	StoringData.useless_keywords
  	StoringData.major_keywords_count
  end

end
