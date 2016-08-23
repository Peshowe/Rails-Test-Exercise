class MessagesController < ApplicationController
	
	def create
		@conversation = Conversation.find(params[:conversation_id])
		@message = @conversation.messages.new(message_params)
		@message.sender = session[:user_email]
		@message.save
		redirect_to conversation_path(@conversation)
	end
	
	private
		def message_params
			params.require(:message).permit(:content)
			
		end
end
