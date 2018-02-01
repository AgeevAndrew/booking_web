class BaseController < ApplicationController
  before_action :merge_current_user!

  private

  def merge_current_user!
    params.merge!(current_user: current_user)
  end
end
