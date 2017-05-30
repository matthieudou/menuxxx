class BookingsController < ApplicationController

 before_action :set_hooker

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = @hooker.bookings.build
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
    params.require(:booking).permit(:star_date, :end_date, :special))
  end

end
