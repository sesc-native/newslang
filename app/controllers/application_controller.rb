class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
    def helloo
    render html: "hello, world!"
    end
  
end
