class ProductReviewsRatingsConfiguration < Configuration
  preference :can_review_product, :integer, :default => 1
  preference :can_rate_product, :integer, :default => 1
  preference :default_review_status, :integer, :default => 1             #(1 = pending, 2 = accepted, 3 = denied)
  preference :product_page_review_count, :integer, :default => 5
end
