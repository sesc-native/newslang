class HomeController < ApplicationController
  def index
    topic = params[:topic]
    language = params[:lang]
    key = ENV["newsapi_key"]
    
    if language.blank?
    
      if topic.blank?
        response = HTTParty.get('https://newsapi.org/v2/top-headlines?apiKey=' + key + '&category=general')
        @hashapi = response.values[2]
      else
        response = HTTParty.get('https://newsapi.org/v2/everything?apiKey=' + key + '&q=' + topic )
        @hashapi = response.values[2]
      end
    
    else

      if topic.blank?
        response = HTTParty.get('https://newsapi.org/v2/top-headlines?apiKey=' + key + '&language=' + language )
        @hashapi = response.values[2]
      else
        response = HTTParty.get('https://newsapi.org/v2/everything?apiKey=' + key + '&q=' + topic + '&language=' + language )
        @hashapi = response.values[2]
      end
      

    end
    
  end
  
end
