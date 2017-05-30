class ReviewsController < ApplicationController

  before_action :find_review, only: [ :show, :destroy, :update, :edit ]
  before_action :find_hooker, only: [ :create ]

  def index
    @reviews = Review.where(["user_id = ?", current_user.id])
  end

  def show

  end

  def update
    @review.update(review_params)
    redirect_to review_path(@review)
  end

  def new
    @review = Review.new
  end

  def edit

  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.hooker = @hooker
    if @review.save
      redirect_to review_path(@review)
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

  def find_hooker
    @hooker = Hooker.find(hooker_id)
  end

  def find_review
    @review = Review.find(params[:id])
  end
end
