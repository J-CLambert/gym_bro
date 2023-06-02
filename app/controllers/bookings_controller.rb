class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update destroy confirm]
  before_action :set_gym, only: %i[new create]
  # skip_before_action :authenticate_user!, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  def index
    @bookings = Booking.all
  end

  def show; end

  def confirm
    @booking.confirmed!
    redirect_back(fallback_location: bookings_path)
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.price = @gym.priceph
    @booking.user = current_user
    @booking.gym = @gym

    respond_to do |format|
      if @booking.save
        format.html { redirect_to gyms_path, notice: "Booking was successfully created." }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to booking_url(@booking), notice: "booking was successfully updated." }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path, notice: 'Booking was successfully deleted.'
  end

  def requested
    # @bookings = []
    @bookings = current_user.bookings
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_at, :duration, :message)
  end

  def set_gym
    @gym = Gym.find(params[:gym_id])
  end
end
