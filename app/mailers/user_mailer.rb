class UserMailer < ApplicationMailer
  default from: "ruthjohnstoncodes@gmail.com"

  def contact_form(email, name, message)
  @message = message
  @email = email
  @name = name
    mail(from: email,
         to: 'ruthjohnstoncodes@gmail.com',
         subject: "A new contact form message from #{name}")
  end

#in order to preivew email, remove .email from method below
  def welcome(user)
    @appname = "Laurel Cottage Ltd"
    mail(to: user.email,
         subject: "Welcome to #{@appname}!")
  end

# when order has been placed
  def order_notification(user, order)
    @appname = "Laurel Cottage Ltd"
    @user_name = (user.first_name || "") + " " + (user.last_name || "")
    if @user_name == " "
      @user_name = user.email
    end
    mail(to: user.email, subject: "Your order at #{@appname}")
  end
end
