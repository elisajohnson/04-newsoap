class UsersController < ApplicationController
  def index
    @topic = Topic.where(id: params[:topic_id])
    @topics = Topic.all
    # @response = HTTParty.get("http://api.npr.org/query?id=1137&apiKey=" + ENV['NPR_API_KEY'])
    # render json: @response
  end

  def update
    @topics = Topic.all
    @topic = Topic.where(params[:id])
    if @topic.value == true && current_user != nil
      current_user.npr_id.push(@topic.npr_id)
      current_user.save
      redirect_to topics_dashboard_path
    else
      redirect_to welcome_index_path
    end
  end

  private
  def topic_params
    params.permit(:topic)
    params.require(:topic).permit(:name, :npr_id, :is_checked)
  end
end
