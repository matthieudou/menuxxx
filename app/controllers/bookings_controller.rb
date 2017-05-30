class BookingsController < ApplicationController

 before_action :set_hooker, only: [:create, :new]

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.hooker = @hooker
    @booking.user = current_user

    if @booking.save
      redirect_to hooker_booking_path(@hooker, @booking)
    else
      render :new
    end
  end

  def edit
  end

  def destroy
    @booking.destroy
    redirect_to hooker_path(@hooker)
  end

  private

  def set_hooker
    @hooker = Hooker.find(params[:hooker_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :special)
  end
  #{}"start_date"=>"1333", "end_date(1i)"=>"2017", "end_date(2i)"=>"5", "end_date(3i)"=>"30", "end_date(4i)"=>"13", "end_date(5i)"=>"50"
end
