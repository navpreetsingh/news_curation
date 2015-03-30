class NewsController < ApplicationController
  def view
  	@news = News.all
  end

  def analysis
  end
end
