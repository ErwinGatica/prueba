class MessagesController < ApplicationController
  before_action :set_message, only: %i[ show edit update destroy ]
  skip_before_action :authenticate_user!, only: %i[ home about geolocation customized show carousel]

  def about
    authorize @messages

  end

  def geolocation

  end

  def customized
    authorize @messages
  end


  def home
    authorize @messages
  end

  def index
      @messages = policy_scope(Message)

  end

  def new
    if current_user.admin
      @message = Message.new
      authorize @message
    else
      redirect_to root_path
    end
  end

  def show

  end

  def edit

  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    authorize @message
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
      authorize @message
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:title, :content, photos: [])
    end
end
