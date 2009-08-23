require 'twitter'


class TwitterProfileImage < Sinatra::Base
  get '/' do
    "Hello, world!"
  end

  get '/user/:name' do
    client = Twitter::Client.new
    user = client.user(params[:name])
    # "Looking up user #{params[:name]}. The profile URL is #{user.profile_image_url}."
    redirect user.profile_image_url
  end

  not_found do
    "Page not found. Try /user/sometwitterusername instead."
  end

  error do
    "Uh oh. Something very bad happened."
  end
end

