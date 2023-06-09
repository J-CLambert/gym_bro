class MessagesController < ApplicationController
  def new
    @message = current_user.sent_messages.new
  end

  def create
    @message = current_user.sent_messages.new(message_params)
    @message.recipient_id = @recipient.id
    @message.sender_id = current_user.id
    @message.save
  end

  def index
    @messages = current_user.messages
  end

  def destroy
    @message = current_user.messages.destroy(params[:id])
  end

  def show
    @message = current_user.messages.find(params[:id])
  end

  private

  def message_params
    params.require(:message).permit(:content, :recipient_id, :sender_id)
  end
end
