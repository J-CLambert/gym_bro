class GymsController < ApplicationController
  before_action :set_gym, only: %i[show edit update destroy bookings]
  # skip_before_action :authenticate_user!, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  def index
    @gyms = Gym.all
  end

  def show
  end

  def new
    @gym = Gym.new
  end

  def create
    @gym = Gym.new(gym_params)
    @gym.user = current_user

    respond_to do |format|
      if @gym.save
        format.html { redirect_to gym_path(@gym), notice: "Review was successfully created." }
        format.json { render :show, status: :created, location: @gym }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gym.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @gym.update(gym_params)
        format.html { redirect_to gym_url(@gym), notice: "gym was successfully updated." }
        format.json { render :show, status: :ok, location: @gym }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gym.errors, status: :unprocessable_entity }
      end
    end
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
    params.require(:gym).permit(:title, :address, :description, :priceph)
  end
end
