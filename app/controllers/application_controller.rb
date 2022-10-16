class ApplicationController < ActionController::Base
  before_action :set_pack, :authenticate_user!

  private

  def set_pack
    @messages = Message.all
    @images = Image.all
  end

end
