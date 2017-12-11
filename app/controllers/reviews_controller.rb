class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_wedding

  def index
    @reviews = Review.where('wedding_id = ?', @wedding.id )
  end

  def show
  end

  def new
    @review = Review.new
  end

  def create
    @review = review.new(review_params)
    @review.user = current_user
    @review.wedding = @wedding
    if @review.save
      redirect_to wedding_review_path(@wedding, @review)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @review.update(review_params)
    redirect_to wedding_review_path(@wedding, @review)
  end

  def destroy
    @review.destroy
    redirect_to wedding_reviews_path(@wedding, @review)
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, photos: [])
  end

  def set_wedding
    @wedding = Wedding.find(params[:wedding_id])
  end

end
