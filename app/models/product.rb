class Product < ApplicationRecord
  has_many :orders
  has_many :comments

  validates :name, presence: true
  validates :description, presence: true
  validates :name, presence: true
  validates :image_url, presence: true
  validates :mediums, presence: true
  validates :price, presence: true

  def self.search(search_term)
    if Rails.env.development?
      Product.where("name LIKE ?", "%#{search_term}%")
    else
      Product.where("name ILIKE ?", "%#{search_term}%")
    end
  end

  def highest_rating_comment
    comments.rating_desc.first
  end

  def lowest_rating_comment
    comments.rating_asc.first
  end

  def average_rating
    comments.average(:rating).to_f
  end

end

