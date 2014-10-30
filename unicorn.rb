worker_processes 1
working_directory '/usr/local/blog'

listen 50000

stderr_path File.expand_path('unicorn.stderr.log', File.dirname(__FILE__))
stdout_path File.expand_path('unicorn.stdout.log', File.dirname(__FILE__))

preload_app true
