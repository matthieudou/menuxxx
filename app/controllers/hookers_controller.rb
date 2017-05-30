class HookersController < ApplicationController

  # passes all the hookers
  def index
    @hookers = Hooker.all
  end

  def show
    @hooker = Hooker.find(params[:id])
  end

  def new
    @hooker = Hooker.new
  end

  # create a new hooker with user_id
  def create
    @hooker = Hooker.new(hooker_params)
    # hooker.set user_id
    @hooker.user = current_user
    if @hooker.save
      redirect_to hooker_path(@hooker)
    else
      render :new
    end
  end

  def edit

  end

  def update
  end

  # user only allowed to destroy his hooker
  def destroy
    # if current user hooker then destroy + flash message 'hooker destroyed'
    # if not current user.hooker then NOTHING + flash message 'you cannot destroy'

  end

  private

  def hooker_params
    params.require(:hooker).permit(
      :name,
      :city,
      :street,
      :postal_code,
      :street_nr,
      :short_description,
      :long_description,
      :price,
      :profile_picture
      )
  end
end