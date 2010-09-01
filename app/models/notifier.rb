class Notifier < ActionMailer::Base
  default :from => "noreply@daemons.org.ua"
  
  def signup_notification(recipient)
    @account = recipient

    # attachments['an-image.jp'] = File.read("an-image.jpg")
    # attachments['terms.pdf'] = {:content => generate_your_pdf_here() }

    mail(:to => recipient.email_address_with_name,
         :subject => "New account information")
  end
end