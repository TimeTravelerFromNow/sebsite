class BlogsController < TutorialsController

   # Get /blogs
  def index
    @tutorials = Tutorial.all.where(is_blog: true)
  end

end
