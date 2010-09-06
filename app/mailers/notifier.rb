class Notifier < ActionMailer::Base
  default :from => "noreply@daemons.org.ua"

  def alert(website)
    @website = website
    @email = website.user.email
    
    mail :to => @email, :subject => "Juliet ERROR: #{website.name}"
  end
    
end