class DashboardController < ApplicationController
  include Auth
  http_basic_authenticate_with name: Auth::USERNAME, password: Auth::PW, only: %i[root blogs tutorials show edit update destroy]

  before_action :set_all_topics
  def root

  end

  def all
    @tutorials = Tutorial.all
  end

  def blogs
    @tutorials = Tutorial.all.where(is_blog: true)
  end

  def tutorials
    @tutorials = Tutorial.all.where(is_blog: false)
  end

  private
    def set_all_topics
      @topics = Topic.all
    end
end
