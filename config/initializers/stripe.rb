if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_1lrwAzBJKxDvdomvki425YNT',
    secret_key: 'sk_test_1DU1iqeSenVr1rLyzsM1Fm0N'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
