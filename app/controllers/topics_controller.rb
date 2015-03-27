class TopicsController < ApplicationController
  def index
    @base_url = 'http://api.npr.org/query?'
    @query = 'id=3002'
    @access_token = '&apiKey='+ENV['NPR_API_KEY']
    @response = HTTParty.get(@base_url+@query+@access_token)['nprml']['list']['story']



    # @response = HTTParty.get("http://api.npr.org/query?id=1149,1059&apiKey=" + ENV['NPR_API_KEY'])['nprml']['list']['story']
    # render json: @response
  end

  def create
  end

  def update
  end

  def destroy
  end
end
