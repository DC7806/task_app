class ApplicationController < ActionController::Base
  
  before_action :set_locale

  private

  def set_locale
    I18n.locale = extract_locale_from_accept_language_header
  end

  def extract_locale_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE'].split(',').first.include?('zh') ? :"zh-TW" : :en
  end

end