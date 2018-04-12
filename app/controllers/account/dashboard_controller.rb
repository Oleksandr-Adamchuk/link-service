class Account::DashboardController < ApplicationController
  LIMIT_TO_SHOW = 10

  before_action :authenticate_user!

  def index
    @link = Link.new
    @arr = []
    @resent_links = current_links.recent.limit(LIMIT_TO_SHOW)
    @resent_links.each { |link| @arr << link.tags }
  end
end
