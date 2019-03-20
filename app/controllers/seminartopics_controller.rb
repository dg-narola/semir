class SeminartopicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_seminartopic, only: [:show, :edit, :update, :destroy]

  # GET /seminartopics
  # GET /seminartopics.json
  def index
    @seminartopics = Seminartopic.all
  end

  # GET /seminartopics/1
  # GET /seminartopics/1.json
  def show
  end

  # GET /seminartopics/new
  def new
    @seminartopic = Seminartopic.new
  end

  # GET /seminartopics/1/edit
  def edit
  end

  # POST /seminartopics
  # POST /seminartopics.json
  def create
    @seminartopic = Seminartopic.new(seminartopic_params)

    respond_to do |format|
      if @seminartopic.save
        format.html { redirect_to @seminartopic, notice: 'Seminartopic was successfully created.' }
        format.json { render :show, status: :created, location: @seminartopic }
      else
        format.html { render :new }
        format.json { render json: @seminartopic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /seminartopics/1
  # PATCH/PUT /seminartopics/1.json
  def update
    respond_to do |format|
      if @seminartopic.update(seminartopic_params)
        format.html { redirect_to @seminartopic, notice: 'Seminartopic was successfully updated.' }
        format.json { render :show, status: :ok, location: @seminartopic }
      else
        format.html { render :edit }
        format.json { render json: @seminartopic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seminartopics/1
  # DELETE /seminartopics/1.json
  def destroy
    @seminartopic.destroy
    respond_to do |format|
      format.html { redirect_to seminartopics_url, notice: 'Seminartopic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seminartopic
      @seminartopic = Seminartopic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def seminartopic_params
      params.require(:seminartopic).permit(:title, :descripton, :studname, :user_id)
    end
end
