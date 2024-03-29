class TopicsController < ApplicationController
  include Auth
  http_basic_authenticate_with name: Auth::USERNAME, password: Auth::PW, only: %i[new create edit update destroy]

  before_action :set_public_topics
  before_action :set_topic, only: %i[ show edit update destroy ]

  # GET /topics or /topics.json
  def index
    #@topics = Topic.all
  end

  # GET /topics/1 or /topics/1.json
  def show
  end

  # GET /topics/new
  def new
    @topic = Topic.new
  end

  # GET /topics/1/edit
  def edit
    @external_link = @topic.external_links.new
  end

  # POST /topics or /topics.json
  def create
    @topic = Topic.new(topic_params)

    respond_to do |format|
      if @topic.save
        format.html { redirect_to topic_url(@topic), notice: "Topic was successfully created." }
        format.json { render :show, status: :created, location: @topic }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /topics/1 or /topics/1.json
  def update
    respond_to do |format|
      if @topic.update(topic_params)
        if address_changed
          format.html { redirect_to dashboard_root_path, notice: "Topic was successfully updated. Title changed!" }
        else
          format.html { redirect_to request.referrer, notice: "Topic was successfully updated." }
        end
        format.json { render :show, status: :ok, location: @topic }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1 or /topics/1.json
  def destroy
    @topic.destroy

    respond_to do |format|
      format.html { redirect_to topics_url, notice: "Topic was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def address_changed
      @topic.title != params[:title]
    end

    def set_public_topics
      @topics = Topic.all.where(:status => "public")
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.find_by!(title: params[:title])
    end

    # Only allow a list of trusted parameters through.
    def topic_params
      params.require(:topic).permit(:title, :description, :explanation, :position, :nav_pos, :icon, :status, :header_image)
    end
end
