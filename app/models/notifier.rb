class Notifier < ActionMailer::Base
  default :from => "noreply@daemons.org.ua"
  
  def bad_response(website, code)
    @website = website
    @email = website.user.email
    mail :to => @email, :subject => "Juliet WARN: #{website.name} returned #{code}"
  end
  
  def timed_out(website)
    @website = website
    @email = website.user.email
    mail :to => @email, :subject => "Juliet ERR: #{website.name} timed out"
  end
    
end