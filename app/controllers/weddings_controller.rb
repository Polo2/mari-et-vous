class WeddingsController < ApplicationController
  before_action :set_wedding, only: [:show, :edit, :update, :destroy]

  # GET /weddings
  # GET /weddings.json
  def index
    @weddings = policy_scope(Wedding)
  end

  # GET /weddings/1
  # GET /weddings/1.json
  def show
    authorize(@wedding)
     @markers = Gmaps4rails.build_markers([@wedding]) do |wedding, marker|
       marker.lat wedding.latitude
       marker.lng wedding.longitude
     end
  end

  # GET /weddings/new
  def new
    @wedding = Wedding.new
    authorize(@wedding)
  end

  # GET /weddings/1/edit
  def edit
    authorize(@wedding)
  end

  # POST /weddings
  # POST /weddings.json
  def create
    @wedding = Wedding.new(wedding_params)
    @wedding.user = current_user
    authorize(@wedding)

    respond_to do |format|
      if @wedding.save
        format.html { redirect_to @wedding, notice: 'Wedding was successfully created.' }
        format.json { render :show, status: :created, location: @wedding }
      else
        format.html { render :new }
        format.json { render json: @wedding.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weddings/1
  # PATCH/PUT /weddings/1.json
  def update
    authorize(@wedding)
    respond_to do |format|
      if @wedding.update(wedding_params)
        format.html { redirect_to @wedding, notice: 'Wedding was successfully updated.' }
        format.json { render :show, status: :ok, location: @wedding }
      else
        format.html { render :edit }
        format.json { render json: @wedding.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weddings/1
  # DELETE /weddings/1.json
  def destroy
    authorize(@wedding)
    @wedding.destroy
    respond_to do |format|
      format.html { redirect_to weddings_url, notice: 'Wedding was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wedding
      @wedding = Wedding.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        redirect_to weddings_path, notice: "The wedding you're looking for does not exist"
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def wedding_params
      params.require(:wedding).permit(:title, :description, :date, :location, :capacity)
    end
end
