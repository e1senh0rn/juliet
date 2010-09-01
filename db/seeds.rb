u = User.create! :email => "monitor@example.org", :full_name => "Monitor Websiteovich", :password => "monitor", :role => 'admin'
[
  { :name => "Google",  :url => 'http://www.google.com', :ttl => 5 },
  { :name => "Yahoo",   :url => 'http://www.yahoo.com/', :ttl => 5 },
].each do |attrs|
  u.websites.create! attrs
end