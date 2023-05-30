class GymsController < ApplicationController
  before_action :set_gym, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  def index
    @gyms = Gym.all
  end


  def show; end

  def new
    @gym = Gym.new
  end

  def create
    @gym = Gym.new(gym_params)
    @gym.save
    redirect_to :root
  end

  def edit; end

  def update
    @gym.update(gym_params)
    redirect_to :root
  end

  def destroy
    @gym.destroy
    redirect_to :root, status: :see_other
  end

  private

  def set_gym
    @gym = Gym.find(params[:id])
  end

  def gym_params
    params.require(:gym).permit(:title, :address, :description, :priceph, :user_id)
  end
end
