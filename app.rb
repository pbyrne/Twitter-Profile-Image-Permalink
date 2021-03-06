require 'rubygems'
require 'sinatra'
require 'twitter'

get '/' do
  # todo - update to use a full HTML page (layout and view)
  "Hit /user/sometwitterusername as a permalink for that user's profile picture. Built using the open-souce Twitter Profile Image Permalink project (http://github.com/pbyrne/Twitter-Profile-Image-Permalink/). We encourage you to host this app yourself for your own use."
end

get '/user/:name' do
  client = Twitter::Client.new
  nomatch = "Unable to find a user with that user name."
  begin
    user = client.user(params[:name])
    if user.profile_image_url
      redirect user.profile_image_url
    else
      nomatch
    end
  rescue Exception => e
    nomatch
  end
end

not_found do
  "Page not found. Try /user/sometwitterusername instead."
end

error do
  "Uh oh. Something very bad happened."
end
