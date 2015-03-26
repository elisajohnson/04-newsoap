class UsersController < ApplicationController
  def index
    @response = HTTParty.get("http://api.npr.org/query?id=1137&apiKey=" + ENV['NPR_API_KEY'])
    render json: @response
  end
end
