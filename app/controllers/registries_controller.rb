class RegistriesController < ApplicationController
  before_action :set_registry, only: [:show, :edit, :update, :destroy]
  before_action :set_wedding

  def index
    @registries = Registry.where('wedding_id = ?', @wedding.id )
  end

  def show
  end

  def new
    @registry = Registry.new
    @registry.guests.build
  end

  def create
    @registry = Registry.new(registry_params)
    @registry.user = current_user
    @registry.wedding = @wedding
    if @registry.save
      redirect_to wedding_registry_path(@wedding, @registry)
    else
      render :new
    end
  end

  def edit
  end

  def update
    binding.pry
    # current_user.registries.find(params[:registry_id])
    @registry.update(registry_params)
    redirect_to wedding_registry_path(@wedding, @registry)
  end

  def destroy
    @registry.destroy
    redirect_to wedding_registries_path(@wedding, @registry)
  end

  private

  def set_registry
    @registry = Registry.find(params[:id])
  end

  def registry_params
    params.require(:registry).permit(:email, guests_attributes: [:id, :name, :presence, :_destroy])
  end

  def set_wedding
    @wedding = Wedding.find(params[:wedding_id])
  end

end
