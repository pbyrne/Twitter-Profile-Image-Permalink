require 'rubygems'
require 'sinatra/base'
require 'lib/twitter-profile-image'

TwitterProfileImage.run! :holst => 'localhost', :port => 9090
