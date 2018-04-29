class PushMessagesController < BaseController

  def index;end

  private

  def store_facade
    Store::Facades::PushMessagesFacade
  end

end
