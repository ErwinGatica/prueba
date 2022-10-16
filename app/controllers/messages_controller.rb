class MessagesController < ApplicationController
  before_action :set_message, only: %i[ show edit update destroy ]
  skip_before_action :authenticate_user!

  def about

  end

  def geolocation

  end

  def customized

  end
  def carousel

  end

  def home

  end

  def index

  end

  def new
    @message = Message.new

  end

  def show

  end

  def edit

  end

  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        format.html { redirect_to message_url(@message), notice: "message was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end

  end

  def update
    respond_to do |format|
      if @message.update(message_params_update)
        format.html { redirect_to message_url(@message), notice: "Article was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @message.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: "Article was successfully destroyed." }
    end
  end

  private

    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:title, :content, photos: [])
    end

    def message_params_update
      params.require(:message).permit(:title, :content)
    end
end
