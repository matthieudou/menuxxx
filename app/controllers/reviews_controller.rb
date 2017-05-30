class ReviewsController < ApplicationController

  before_action :find_review, only: [ :show, :destroy, :update, :edit ]

  def index
    @reviews = Review.where(["user_id = ?", current_user.id])
  end

  def show
    #find
  end

  def update
    if current_user == @review.user
      if @review.update(review_params)
        redirect_to hooker_path(@review.hooker_id)
      else
        render :new
      end
    end
  end

  def edit
    #find
    redirect_to review_path(@review) unless current_user == @review.user
  end

  def new
    @hooker = Hooker.find(params[:hooker_id])
    @review = Review.new
  end

  def create
    @hooker = Hooker.find(params[:hooker_id])
    @review = Review.new(review_params)
    @review.hooker = @hooker
    @review.user = current_user
    if @review.save
      redirect_to hooker_path(@review.hooker)
    else
      render :new
    end
  end

  def destroy
    @hooker = @review.hooker
    @review.destroy
    redirect_to hooker_path(@hooker)
  end



  private

  def review_params
    params.require(:review).permit(:title, :content, :rating)
  end

  def find_review
    @review = Review.find(params[:id])
  end
end
