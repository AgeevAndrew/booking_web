# frozen_string_literal: true

class BaseController < ApplicationController
  before_action :merge_current_user!
  before_action :set_store

  private

  def merge_current_user!
    params.merge!(current_user: current_user)
  end

  def set_store
    params[:store_facade] = store_facade

    present Store::Operation
    redux_store('SharedReduxStore', props: @operation.to_json)
  end

  def store_facade
    Store::Facades::BaseFacade
  end
end
