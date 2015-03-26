class TopicsController < ApplicationController
  def index
    @user_topics = [
    @base_url = 'http://api.npr.org/query?',
    #'id=1137' //grace hopper
    @query = 'id=3002',
    @access_token = '&apiKey=' + ENV['NPR_API_KEY'],
    @response = HTTParty.get(@base_url+@query+@access_token)['nprml']['list']['story'][i]['title'],
    @teaser_response = HTTParty.get(@base_url+@query+@access_token)['nprml']['list']['story'][i]['teaser'],
    @link_response = HTTParty.get(@base_url+@query+@access_token)['nprml']['list']['story'][i]['link'][0]['__content__']
    ]
    # @response = HTTParty.get("http://api.npr.org/query?id=1137&apiKey=" + ENV['NPR_API_KEY'])
    # render json: @response
  end

  def create
  end

  def update
  end

  def destroy
  end
end
