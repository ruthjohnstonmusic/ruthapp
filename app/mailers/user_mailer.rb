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
end
