class ReviewsController < Spree::BaseController
  resource_controller

  def index
    @product = Product.find_by_permalink!(params[:product_id])
    @reviews = []
    @product.reviews.each { |review| @reviews << review if review.review_status.status == 'accepted' }
  end

  create.before do
    user_review = Review.find(:first, :conditions => { :product_id => params[:review][:product_id], :user_id => params[:review][:user_id]} )
    Review.delete(user_review) if user_review
  end

  create.response do |wants|
    wants.html { render :json => { :title => object.title, :content => object.content, :id => object.id, :user_id => object.user_id, :status => object.review_status_id }.to_json, :layout => false }
  end

  destroy.before do
    Rating.delete(object.rating)
  end

  destroy.response do |wants|
    wants.html { render :json => { :success => 1 }.to_json, :layout => false }
  end
end
