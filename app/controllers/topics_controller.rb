class TopicsController < ApplicationController

  def index
    if user_signed_in?
      @topics = Topic.all
    else
      @topics = Topic.all
    end

    @base_url = 'http://api.npr.org/query?id='
    @access_token = '&apiKey='+ENV['NPR_API_KEY']

    # @response = HTTParty.get("http://api.npr.org/query?id=1137&apiKey=" + ENV['NPR_API_KEY'])['nprml']['list']
    # render json: @response
  end

  def create
    @topics = Topic.all
    @topic = Topic.where(id: params[:topic_id])
    if @topic.checked && current_user != nil
      current_user.npr_id.push(@topic.npr_id)
      current_user.save
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
    @user_topics = UserTopic.where(:user_id => current_user)

    current_user.user_topics.each do |x|
      @query = x.topic.npr_id.to_s
    end
    if @query.nil?
      @topics = Topic.all
    else
    @base_url = 'http://api.npr.org/query?id='
    @access_token = '&apiKey='+ENV['NPR_API_KEY']
    @responsie = HTTParty.get(@base_url+@query+@access_token)['nprml']['list']['story']
    end
  end

private
  def topic_params
    params.require(:topic).permit(:topic_id, :name, :npr_id, :is_checked)
  end
end
