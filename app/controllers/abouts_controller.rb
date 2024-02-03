class AboutsController < ApplicationController
  include Auth
  http_basic_authenticate_with name: Auth::USERNAME, password: Auth::PW, only: %i[ show edit update destroy]
  before_action :set_about, only: %i[ show edit update destroy ]
  # GET /abouts or /abouts.json
  def index
    @abouts = About.all
    @topics = Topic.all
  end

  # GET /abouts/1 or /abouts/1.json
  def show
  end

  # GET /abouts/new
  def new
    @about = About.new
  end

  # GET /abouts/1/edit
  def edit
  end

  # POST /abouts or /abouts.json
  def create
    swap_default()
    @about = About.new(about_params)

    respond_to do |format|
      if @about.save
        format.html { redirect_to about_url(@about), notice: "About was successfully created." }
        format.json { render :show, status: :created, location: @about }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @about.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /abouts/1 or /abouts/1.json
  def update
    swap_default()
    respond_to do |format|
      if @about.update(about_params)
        format.html { redirect_to about_url(@about), notice: "About was successfully updated." }
        format.json { render :show, status: :ok, location: @about }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @about.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /abouts/1 or /abouts/1.json
  def destroy
    @about.destroy

    respond_to do |format|
      format.html { redirect_to abouts_url, notice: "About was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_about
      @about = About.find(params[:id])
    end

    def swap_default
        if( about_params["default"] != false)
          About.all.where(:default => true).each do |about|
            if( @about != about )
              about.update(:default => false)
              about.save
            end
          end
        end
    end

    # Only allow a list of trusted parameters through.
    def about_params
      params.require(:about).permit(:default, :body, :portrait, :topic_id)
    end
end
