class TutorialsController < ApplicationController

  before_action :set_public_topics
  before_action :set_tutorial, only: %i[ show edit update destroy ]

  before_action :set_topic, only: %i[ update ]

  # GET /tutorials or /tutorials.json
  def index
    @tutorials = Tutorial.all
  end

  # GET /tutorials/1 or /tutorials/1.json
  def show
  end

  # GET /tutorials/new
  def new
    @tutorial = Tutorial.new
    @topics = Topic.all
  end

  # GET /tutorials/1/edit
  def edit
    @topics = Topic.all
    @material = @tutorial.materials.new
  end

  # POST /tutorials or /tutorials.json
  def create
    @topics = Topic.all

    @tutorial = Tutorial.new(tutorial_params)

    respond_to do |format|
      if @tutorial.save
        format.html { redirect_to edit_tutorial_url(@tutorial), notice: "Tutorial was successfully created." }
        format.json { render :show, status: :created, location: @tutorial }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tutorial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tutorials/1 or /tutorials/1.json
  def update
    respond_to do |format|
      if @tutorial.update(tutorial_params)
        if address_changed
          format.html { redirect_to edit_tutorial_path(@tutorial), notice: "Tutorial was successfully updated, address changed." }
        else
          format.html { redirect_to request.referrer, notice: "Tutorial was successfully updated." }
        end
        format.json { render :show, status: :ok, location: @tutorial }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tutorial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tutorials/1 or /tutorials/1.json
  def destroy
    @tutorial.destroy

    respond_to do |format|
      format.html { redirect_to tutorials_url, notice: "Tutorial was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def address_changed
      @tutorial.address != params[:address]
    end

    def set_public_topics
      @topics = Topic.all.where(:status => "public")
    end

    def set_topic
      if( params[:topic_id] )
        @tutorial.topic = Topic.find(params[:topic_id])
        @tutorial.update(params)
      else
        if @tutorial.topic
          @tutorial.topic = nil
          @tutorial.save
        end
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_tutorial
      @tutorial = Tutorial.find_by!(address: params[:address])
    end

    # Only allow a list of trusted parameters through.
    def tutorial_params
      params.require(:tutorial).permit(:address, :title, :topic_id, :description, :featured, :icon, :status)
    end
end
