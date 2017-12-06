class ConversationController < ApplicationController
  def index
  	@users = User.all
  	@conversations = Conversation.all
  end

  def show
  	@other_user = User.find(other_user_param[:other_user_id])
  	@conversation = Conversation.where(["user1_id = ? AND user2_id = ?",current_user.id, @other_user.id]).first
  	if @conversation.nil?
  		@conversation = Conversation.where(["user2_id = ? AND user1_id = ?",current_user.id, @other_user.id]).first
  	end
  	if @conversation.nil?
  		@conversation = Conversation.new()
  		@conversation.user1 = current_user
  		@conversation.user2 = @other_user
  		@conversation.save
  	end
  	@messages = @conversation.messages.reverse
  end
  private
  	# Use callbacks to share common setup or constraints between actions.
  	def other_user_param
  		params.permit(:other_user_id)
  	end
end
