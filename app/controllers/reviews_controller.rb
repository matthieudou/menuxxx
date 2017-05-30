class ReviewsController < ApplicationController

  before_action :find_review, only: [ :show, :destroy, :update, :edit ]
  before_action :find_hooker, only: [ :create ]

  def index
    @reviews = Review.where(["user_id = ?", current_user.id])
  end

  def show
    #find
  end

  def update
    @review.update(review_params)
    redirect_to review_path(@review)
  end

  def edit
    #find
  end

  def new
    @review = Review.new
  end

  def create
    @hooker = Hooker.find(params[:hooker_id])
    @review = Review.new(review_params)
    @review.hooker = @hooker
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

  def find_hooker
    @hooker = Hooker.find(hooker_id)
  end

  def find_review
    @review = Review.find(params[:id])
  end
end
