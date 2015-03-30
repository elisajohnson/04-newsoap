class TopicsController < ApplicationController
  def index
    if user_signed_in?
      redirect_to welcome_index_path
    else
      @topics = Topic.all
    end

    # @topic = Topic.new

    # @base_url = 'http://api.npr.org/query?id='
    # @query = :query.to_i
    # @access_token = '&apiKey='+ENV['NPR_API_KEY']
    # @responsie = HTTParty.get(@base_url+@query+@access_token)['nprml']['list']['story']

    # @response = HTTParty.get("http://api.npr.org/query?id=1137&apiKey=" + ENV['NPR_API_KEY'])['nprml']['list']
    # render json: @response
    #   end
  end

  def create
    @topic = Topic.new
    if @topic.save
      redirect_to topics_dashboard_path
    else
      redirect_to welcome_index_path
    end
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

  def topic_params
    params.require(:topic).permit(:npr_id)
  end
end
