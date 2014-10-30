#!/usr/bin/env ruby

require 'sinatra'
require 'json'

dir = File.dirname(__FILE__)
SYNC_SCRIPT = "#{dir}/build.sh"

post "/" do
  push = JSON.parse(params[:payload])
  if push["repository"]["id"] == 11420983
    pid = Process.spawn(SYNC_SCRIPT, :out => '/dev/null', :err => '/dev/null')
    Process.detach pid
    "ok."
  end
end
