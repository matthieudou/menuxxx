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
        flash[:notice] = "Review updated"
        redirect_to hooker_path(@review.hooker_id)
      else
        flash[:alert] = "Invalid changes"
        render :new
      end
    end
  end

  def edit
    unless current_user == @review.user
      flash[:alert] = "You can only update your own reviews"
      redirect_to review_path(@review)
    end
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
      flash[:notice] = "Review added !"
      respond_to do |format|
        format.html { redirect_to hooker_path(@hooker) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'hookers/show' }
        format.js
      end
    end
  end

  def destroy
    unless current_user == @review.user
      flash[:alert] = "You can't delete other people's reviews"
      redirect_to hooker_path(@review.user)
    end
    @review.destroy
    flash[:notice] = "Review deleted !"
  end

  private

  def review_params
    params.require(:review).permit(:title, :content, :rating)
  end

  def find_review
    @review = Review.find(params[:id])
  end
end
