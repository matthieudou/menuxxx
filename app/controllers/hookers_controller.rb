class HookersController < ApplicationController
  before_action :set_hooker, only: [:show, :edit, :update, :destroy]
  # passes all the hookers
  def index
    @hookers = Hooker.all
  end

  def show
    @review = Review.new
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
    unless current_user == @hooker.user
      flash[:alert] = "You can't update an other person's hooker"
      redirect_to hooker_path(@hooker)
    end
  end

  def update
    # only the creater should be able to update
    if current_user == @hooker.user
      if @hooker.update(hooker_params)
        flash[:notice] = "Hooker well updated"
        redirect_to hooker_path(@hooker)
      else
        render :new
      end
    end
  end

  # user only allowed to destroy his hooker
  def destroy
    # if current user hooker then destroy + flash message 'hooker destroyed'
    # if not current user.hooker then NOTHING + flash message 'you cannot destroy'
    unless current_user == @hooker.user
      flash[:notice] = "You can't destroy a hooker that's not yours"
      redirect_to hooker_path(@hooker)
    end

    @hooker.destroy
    redirect_to hookers_path

  end

  private

  def set_hooker
    @hooker = Hooker.find(params[:id])
  end

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
      :profile_picture,
      :photo,
      :photo_cache
      )
  end
end
