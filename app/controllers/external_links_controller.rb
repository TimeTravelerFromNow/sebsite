class ExternalLinksController < ApplicationController
  include Auth
  http_basic_authenticate_with name: Auth::USERNAME, password: Auth::PW, only: %i[ new create  edit update destroy]

  before_action :set_parent
  before_action :set_external_link, except: %i[create]

  def create
    if @tutorial
      @external_link = @tutorial.external_links.build(external_link_params)
      set_icon_from_key()
      respond_to do |format|
        if @external_link.save
          format.html { redirect_to edit_links_path(@tutorial), notice: "external link was successfully created." }
          format.json { render :show, status: :created, location: @tutorial }
        else
          format.html { redirect_to  edit_tutorial_url(@tutorial), status: :unprocessable_entity }
          format.json { render json: @tutorial.errors, status: :unprocessable_entity }
        end
      end # do format
    end
    if @topic
      @external_link = @topic.external_links.build(external_link_params)
      set_icon_from_key()
      respond_to do |format|
        if @external_link.save
          format.html { redirect_to edit_topic_url(@topic), notice: "external link was successfully created." }
          format.json { render :show, status: :created, location: @topic }
        else
          format.html { redirect_to edit_topic_url(@topic), status: :unprocessable_entity }
          format.json { render json: @topic.errors, status: :unprocessable_entity }
        end
      end # do format
    end
  end

  def update
    if @tutorial
      respond_to do |format|
        if @external_link.update(external_link_params)
          format.html { redirect_to edit_links_path(@tutorial), notice: "external link was successfully updated." }
          format.json { render :show, status: :created, location: @tutorial }
        else
          format.html { redirect_to edit_tutorial_url(@tutorial), status: :unprocessable_entity }
          format.json { render json: @tutorial.errors, status: :unprocessable_entity }
        end
      end # do format
    end
    if @topic
      respond_to do |format|
        if @external_link.update(external_link_params)
          format.html { redirect_to edit_tutorial_url(@topic), notice: "external link was successfully updated." }
          format.json { render :show, status: :created, location: @topic }
        else
          format.html { redirect_to edit_tutorial_url(@topic), status: :unprocessable_entity }
          format.json { render json: @topic.errors, status: :unprocessable_entity }
        end
      end # do format
    end
  end

  def destroy
    if @tutorial
      @external_link.destroy
      redirect_to edit_links_path(@tutorial)
    end

    if @topic
      @external_link.destroy
      redirect_to edit_topic_url(@topic)
    end
  end

  private
    def set_icon_from_key
      if( external_link_params[:icon] == nil && @external_link != nil )
          @external_link.icon = Links.icon_path_for(external_link_params[:key])
      end
    end

    def set_parent
      if params[:tutorial_address]
        @tutorial = Tutorial.find_by!(address: params[:tutorial_address])
      end
      if params[:topic_title]
        @topic = Topic.find_by!(title: params[:topic_title])
      end
    end

    def set_external_link
      if @tutorial
        @external_link = @tutorial.external_links.find(params[:id])
      end
      if @topic
        @external_link = @topic.external_links.find(params[:id])
      end
    end
    # Only allow a list of trusted parameters through.
    def external_link_params
      params.require(:external_link).permit(:address, :key, :icon, :custom_icon, :tutorial_address, :topic_title)
    end
end
