module Api::V1
  class MessagesController < ApplicationController
    before_action :set_message, only: [:show, :update, :destroy]
    
    # GET /messages
    def index
      @messages = Message.order(id: :desc)
    
      render json: @messages
    end
    
    # GET /messages/1
    def show
      render json: @message
    end
  
    # POST /messages
    def create
      @message = Message.new(message_params)
      language_id = @message.language_id
      sender = @message.sender
      recipient = @message.recipient
      sender_level = Proficiency.where(user_id: sender.id, language_id: language_id)
      recipient_level = Proficiency.where(user_id: recipient.id, language_id: language_id)

      if 
        # LOGIC HERE!
        
        if @message.save
          render json: @message, status: :created
        else
          render json: @message.errors, status: :unprocessable_entity
      else
        # levels not within 2 
        render json: { status: 400, message: "Error saving your data." }.to_json
      end  
    end  
    # PATCH/PUT /messages/1
    def update
      if @message.update(message_params)
        render json: @message
      else
        render json: @message.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /messages/1
    def destroy
      @message.destroy
      if @message.destroy
        head :no_content, status: :ok
      else
        render json: @message.errors, status: :unprocessable_entity
      end      
    end
  
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def message_params
      params.require(:message).permit(:text, :sender_id, :recipient_id, :language_id)
    end
  end
end