# frozen_string_literal: true

module Language
  module_function

  LANGUAGES = {
    'ru' => 'Русский',
    'en' => 'English',
  }.freeze

  def all
    LANGUAGES
  end

  def locales
    LANGUAGES.keys
  end

  def name(locale)
    LANGUAGES[locale]
  end

  def alternatives(locale)
    LANGUAGES.except(locale)
  end
end
