#!/usr/bin/env ruby

require 'sinatra'
require 'json'

dir = File.dirname(__FILE__)
SYNC_SCRIPT = "#{dir}/build.sh"

post "/" do
  push = JSON.parse(params[:payload])
  system(SYNC_SCRIPT) if push["repository"]["id"] == 11420983
  "ok."
end
