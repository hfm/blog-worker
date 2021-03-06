#!/usr/bin/env ruby

require 'sinatra'
require 'json'

dir = File.expand_path(File.dirname(__FILE__))
SYNC_SCRIPT = "#{dir}/build.sh"

class BlogWorker < Sinatra::Base
  post "/" do
    push = JSON.parse(params[:payload])
    if push["repository"]["id"] == 11420983
      pid = Process.spawn(SYNC_SCRIPT, :out => '/dev/null', :err => '/dev/null')
      Process.detach pid
      "ok."
    end
  end
end
