namespace :app do
  namespace :unicorn do
    
    desc 'Start Unicorn'
    task :start do
      if File.exists?('tmp/pids/unicorn.pid')
        puts "Already running?"
        exit 0
      else
        system "unicorn_rails -c config/unicorn.conf.rb -D"
      end
    end
    
    desc 'Stop Unicorn'
    task :stop do
      system "kill -TERM `cat tmp/pids/unicorn.pid`"
    end
    
    desc 'Restart Unicorn'
    task :restart => [:stop, :start]
  
    desc 'Reload Unicorn'
    task :reload do
      system 'kill -HUP `cat tmp/pids/unicorn.pid`'
    end
  end
end