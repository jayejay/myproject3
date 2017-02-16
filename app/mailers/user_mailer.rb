class UserMailer < ApplicationMailer
  default from: "from@example.com"

  def contact_form(email, name, message)
    @message = message
    mail(:from => email,
         :to => 'julianeissing@web.de',
         :subject => "A new contact form message from #{name}"
    )
  end

  def welcome(user)
    @appname = "Soft-Shop"
    mail( :to => user.email,
          :subject => "Welcome Buddy to #{@appname}!"
    )
  end

end
