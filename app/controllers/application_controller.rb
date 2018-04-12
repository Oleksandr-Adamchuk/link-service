class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_links
    current_user&.links
  end
end
