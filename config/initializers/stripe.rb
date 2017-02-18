if Rails.env.production?
  Rails.configuration.stripe = {
      :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
      :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
      :publishable_key => 'pk_test_APcyGiCMOaaf7s7trB6HrIeL',
      :secret_key => 'sk_test_eB2x9JuBaKFu1s2lxm6QNglG'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]