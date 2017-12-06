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
  end

  def create
    @registry = Registry.new(registry_params)
    @registry.user = current_user
    @registry.wedding = @wedding
    @registry.save
    # redirect_to wedding_path(@registry.wedding)
    redirect_to wedding_registry_path(@wedding, @registry)
  end

  def edit
  end

  def update
    current_user.registries.find(params[:user_id])
    @registry.update(registry_params)
    redirect_to registry_path
  end

  def destroy
    @registry.destroy
    redirect_to registries_path
  end

  private

  def set_registry
    @registry = Registry.find(params[:id])
  end

  def registry_params
    params.require(:registry).permit(:email, guest_names: [])
  end

  def set_wedding
    @wedding = Wedding.find(params[:wedding_id])
  end
end
