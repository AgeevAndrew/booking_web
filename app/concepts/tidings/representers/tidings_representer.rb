# frozen_string_literal

module Tidings::Representers
  class TidingsRepresenter < ApplicationRepresenter
    collection :tidings, decorator: TidingRepresenter
  end
end
