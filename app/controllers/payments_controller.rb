class PaymentsController < ApplicationController
  before_action :authenticate_user!
  # POST /payments
  # POST /payments.json
  def create
    @product = Product.find(params[:product_id])
    @user = current_user
    token = params[:stripeToken]
    # Create the charge on Stripe's servers - this will charge the user's card
    begin
    charge = Stripe::Charge.create(
      amount: (@product.price*100).to_i, # amount in pennies, again
      currency: "gbp",
      source: token,
      description: @product.name,
      receipt_email: @user.email
    )

      if charge.paid
        Order.create!(
          :product_id => @product.id,
          :user_id => @user.id,
          :total => @product.price
        )
        UserMailer.order_notification(@user, @order).deliver_now
      end

    rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]} Your card has not been charged. Please try again."
    end
    redirect_to product_path(@product), notice: "Your payment was processed successfully! Thank you for your purchase."
  end
 end
