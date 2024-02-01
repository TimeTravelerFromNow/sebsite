class DashboardController < ApplicationController
  def root
    @topics = Topic.all
  end

end
