#!/usr/bin/env ruby

require 'sinatra'
require 'json'

here = File.dirname(__FILE__)
SYNC_SCRIPT = "#{here}/build.sh"

post "/" do
  push = JSON.parse(params[:payload])
  system(SYNC_SCRIPT)
  "ok."
end
