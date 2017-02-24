FactoryGirl.define do

  sequence(:name) {|n|  "test_product_#{n}"}
  sequence(:description) {|n|  "description of test_product_#{n}"}

  factory :product do
    name
    description
    image_url "dvd.png"
    mediums "Download"
    price "10000"

  end

end