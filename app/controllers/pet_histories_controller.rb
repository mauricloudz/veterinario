class PetHistoriesController < ApplicationController
  before_action :get_pet
  before_action :set_pet_history, only: [:show, :edit, :update, :destroy]

  # GET /pet_histories
  # GET /pet_histories.json
  def index
    @pet_histories = @pet.pet_histories
  end

  # GET /pet_histories/1
  # GET /pet_histories/1.json
  def show
  end

  # GET /pet_histories/new
  def new
    @pet_history = @pet.pet_histories.build
    # @pets = Pet.pluck :name, :id
  end

  # GET /pet_histories/1/edit
  def edit
    # @pets = Pet.pluck :name, :id
  end

  # POST /pet_histories
  # POST /pet_histories.json
  def create
    @pet_history = @pet.pet_histories.build(pet_history_params)

    respond_to do |format|
      if @pet_history.save
        format.html { redirect_to client_pet_pet_histories_path(@client, @pet), notice: 'Pet history was successfully created.' }
        format.json { render :show, status: :created, location: @pet_history }
      else
        format.html { render :new }
        format.json { render json: @pet_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pet_histories/1
  # PATCH/PUT /pet_histories/1.json
  def update
    respond_to do |format|
      if @pet_history.update(pet_history_params)
        format.html { redirect_to client_pet_pet_history_path(@client, @pet), notice: 'Pet history was successfully updated.' }
        format.json { render :show, status: :ok, location: @pet_history }
      else
        format.html { render :edit }
        format.json { render json: @pet_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pet_histories/1
  # DELETE /pet_histories/1.json
  def destroy
    @pet_history.destroy
    respond_to do |format|
      format.html { redirect_to client_pet_pet_histories_path, notice: 'Pet history was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet_history
      @pet_history = @pet.pet_histories.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pet_history_params
      params.require(:pet_history).permit(:weight, :heigth, :description, :pet_id)
    end

    def get_pet
      @pet = Pet.find(params[:pet_id])
      @client = Client.find(params[:client_id])
    end

end
