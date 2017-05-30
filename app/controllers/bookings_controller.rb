class BookingsController < ApplicationController

 before_action :set_hooker

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
  @booking = Booking.find(params[:id])
  unless current_user == @booking.user
    flash[:alert] = "You can't update an other person's booking"
    redirect_to hooker_booking_path(@hooker, @booking)
  end
end

def update
    # only the creater should be able to update
    @booking = Booking.find(params[:id])
    if current_user == @booking.user
      if @booking.update(booking_params)
        flash[:notice] = "Booking well updated"
         redirect_to hooker_booking_path(@hooker, @booking)
      else
        render :new
      end
    end
end


def destroy
    @booking = Booking.find(params[:id])
  unless current_user == @booking.user
    flash[:notice] = "You can't cancel a fuck"
    redirect_to hooker_booking_path(@hooker, @booking)
  end
  @booking.destroy
  redirect_to hooker_bookings_path(@hooker)
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
