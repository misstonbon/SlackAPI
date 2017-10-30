class ChatController < ApplicationController

  def index
    @channels = SlackApiWrapper.list_channels
  end

  def new
    @channel = params[:channel]
  end

  def create
    @channel = params[:channel]
    if SlackApiWrapper.send_message(@channel, params[:message])
      redirect_to root_path
    else
      render :new
    end
  end

end
