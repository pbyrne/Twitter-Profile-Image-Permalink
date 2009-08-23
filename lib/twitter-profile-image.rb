require 'twitter'


class TwitterProfileImage < Sinatra::Base
  get '/' do
    "Hello, world!"
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
end

