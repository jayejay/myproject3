class StaticPagesController < ApplicationController
  def about
  end

  def contact
  end

  def landing_page
    @featured_product = Product.last(3)
  end

end
