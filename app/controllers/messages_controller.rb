class MessagesController < ApplicationController

  def create
  end

  private

    def message_params
      params.require(:message).permit(:name, :email, :phone, :body)
    end

end
