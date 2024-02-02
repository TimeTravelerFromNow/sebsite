class DashboardController < ApplicationController
  before_action :set_all_topics
  def root

  end

  def blogs
    @blogs = Blog.all
  end

  def tutorials
    @tutorials = Tutorial.all
  end

  private
    def set_all_topics
      @topics = Topic.all
    end
end
