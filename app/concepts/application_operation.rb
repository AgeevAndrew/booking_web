# frozen_string_literal: true

require 'representable/json'

class ApplicationOperation < Trailblazer::Operation
  extend Representer::DSL
  include Representer::Rendering

  def process(*); end

  def current_user
    @params[:current_user]
  end

  def current_locale
    @params[:current_locale]
  end
end
