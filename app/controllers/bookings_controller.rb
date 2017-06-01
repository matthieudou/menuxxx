class BookingsController < ApplicationController


 before_action :set_hooker, except: [:all_bookings]
 def index

  @bookings = Booking.where(["user_id = ?", current_user.id])
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
        flash[:notice] = "Booked"
         redirect_to hooker_booking_path(@hooker, @booking)
      else
        render :new
      end
    end
end


def destroy
    @booking = Booking.find(params[:id])
  unless current_user == @booking.user
    flash[:alert] = "You can't cancel a fuck"
    redirect_to hooker_booking_path(@hooker, @booking)
  end
  @booking.destroy
  redirect_to hooker_bookings_path(@hooker)
  end

  def all_bookings

    @bookings = current_user.bookings
  end

private

def set_hooker
  @hooker = Hooker.find(params[:hooker_id])
end

def booking_params
  params.require(:booking).permit(:start_date, :end_date, :special)
end

end
