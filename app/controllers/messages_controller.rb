class MessagesController < ApplicationController
  before_action :set_message, only: %i[ show edit update destroy ]
  skip_before_action :authenticate_user!

  def carousel
    @messages= Messages.all
  end

  def home
    @messages = Message.all
  end

  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
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
      if @message.update(message_params)
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
end
