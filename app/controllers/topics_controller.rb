class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    # @response = HTTParty.get("http://api.npr.org/query?id=1137&apiKey=" + ENV['NPR_API_KEY'])['nprml']['list']
    # render json: @response
  end

  def create
  end

  def update
  end

  def destroy
  end

  def dashboard
    @base_url = 'http://api.npr.org/query?'
    @query = 'id=3004'
    @access_token = '&apiKey='+ENV['NPR_API_KEY']
    @responsie = HTTParty.get(@base_url+@query+@access_token)['nprml']['list']['story']
  end
end
