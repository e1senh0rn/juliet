listen 2010 # by default Unicorn listens on port 8080
worker_processes 2 # this should be >= nr_cpus

pid File.expand_path('../../tmp/pids/unicorn.pid', __FILE__)
stderr_path File.expand_path('../../log/unicorn.log', __FILE__)
stdout_path File.expand_path('../../log/unicorn.log', __FILE__)