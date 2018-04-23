class Api::PushMessagesController < Api::BaseController
  before_action :authenticate_user!
  def create
    respond PushMessages::Create, location: nil
  end
end
