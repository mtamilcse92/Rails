class RegisterSchoolsController < ApplicationController
  before_action :set_register_school, only: [:show, :edit, :update, :destroy]

  # GET /register_schools
  # GET /register_schools.json
  def index
    @register_schools = RegisterSchool.all
  end

  # GET /register_schools/1
  # GET /register_schools/1.json
  def show
    
  end

  # GET /register_schools/new
  def new
    @register_school = RegisterSchool.new
  end

  # GET /register_schools/1/edit
  def edit
  end

  # POST /register_schools
  # POST /register_schools.json
  def create
    @register_school = RegisterSchool.new(register_school_params)

    respond_to do |format|
      if @register_school.save
        format.html { redirect_to @register_school, notice: 'Register school was successfully created.' }
        format.json { render :show, status: :created, location: @register_school}
      else
        format.html { render :new }
        format.json { render json: @register_school.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /register_schools/1
  # PATCH/PUT /register_schools/1.json
  def update
    respond_to do |format|
      if @register_school.update(register_school_params)
        format.html { redirect_to @register_school, notice: 'Register school was successfully updated.' }
        format.json { render :show, status: :ok, location: @register_school }
      else
        format.html { render :edit }
        format.json { render json: @register_school.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /register_schools/1
  # DELETE /register_schools/1.json
  def destroy
    @register_school.destroy
    respond_to do |format|
      format.html { redirect_to register_schools_url, notice: 'Register school was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_register_school
      @register_school = RegisterSchool.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def register_school_params
      params.require(:register_school).permit(:school_name, :address, :city, :state, :pin_code, :affiliated_board)
    end
end
