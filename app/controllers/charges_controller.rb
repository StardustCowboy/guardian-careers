class ChargesController < ApplicationController
before_action :authenticate_user!
	

def new
end

def create
  # Amount in cents
  #@amount = 500

  customer = Stripe::Customer.create(
    :email => current_user.email,
    :card  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => params[:amount],
    :description => 'Rails Stripe customer',
    :currency    => 'usd',
    :receipt_email => "erskine.matthews@gmail.com"
  )

  current_user.paid = true
  current_user.save
rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to charges_path
end


end
