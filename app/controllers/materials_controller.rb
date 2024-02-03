class MaterialsController < ApplicationController
  include Auth
  http_basic_authenticate_with name: Auth::USERNAME, password: Auth::PW, only: %i[ new create edit update destroy]

  before_action :set_parent
  before_action :set_material, except: %i[create]

  def create
    if @tutorial
      @material = @tutorial.materials.build(material_params)
      respond_to do |format|
        if @material.save
          format.html { redirect_to edit_tutorial_url(@tutorial), notice: "material was successfully created." }
          format.json { render :show, status: :created, location: @tutorial }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @tutorial.errors, status: :unprocessable_entity }
        end
      end # do format
    end
  end

  def update
    if @tutorial
      respond_to do |format|
        if @material.update(material_params)
          format.html { redirect_to edit_tutorial_url(@tutorial), notice: "material was successfully created." }
          format.json { render :show, status: :created, location: @tutorial }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @tutorial.errors, status: :unprocessable_entity }
        end
      end # do format
    end
  end

  def destroy
    if @tutorial
      @material.destroy
      redirect_to edit_tutorial_url(@tutorial)
    end

    if @blog
      @material.destroy
      redirect_to edit_blog_url(@blog)
    end
  end

  private
    def set_parent
      if params[:tutorial_address]
        @tutorial = Tutorial.find_by!(address: params[:tutorial_address])
      end
    end

    def set_material
      if @tutorial
        @material = @tutorial.materials.find(params[:id])
      end
    end
    # Only allow a list of trusted parameters through.
    def material_params
      params.require(:material).permit(:content_type, :content, :code_content, :lang, :image, :width, :tutorial_address)
    end
end
