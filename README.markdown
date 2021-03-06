## What is this?

This is a simple Sinatra app to provide yourself with permalinks to [Twitter][twitter] profile picture images.

Why is this necessary? Any time a user updates their profile picture on Twitter, the new picture gets a new URL. This means that if you use these image URLs to display profile pictures, you won't always display their most recent profile picture. If Twitter deletes an old, unused profile picture, then not only are you out of date, you've now got a broken image on your page.

Of course, ideally Twitter would provide sensible permanent links to user's profile images. Barring that, this seems the best alternative.

## What are the system requirements?

This requires Ruby (of course) and the following gems:

* [Rack][rack]
* [Sinatra][sinatra]
* [Twitter4R][twitter4r]

## How does it work?

Deploy this as you would a normal Sinatra app. The project has an included Rackup file for use in [Passenger][passenger] (mod_rails) environments, but you can deploy it however you'd like.

Once it's up and running, http://example.com/user/twitterusername will redirect to the current profile image for the given user name. If an invalid username is given, no image is provided. (The behavior for invalid user names may change in the future.)

## Are there plans for improvements?

Yes, I've got a couple areas I'd like to round out once I get this deployed and start using it myself. This initial release is all about getting the simplest thing that could possibly work, and then actual use will drive future improvements.

1. Rather than redirecting (and incurring a second HTTP hit in the browser), I'd like to instead capture the profile image within the app and serve it as if it were local. I haven't yet worked out the best way to do this, or if it is even necessary.
2. I'd like to offer a more sensible alternative for invalid usernames than just not serving up an image. This would likely entail a default "I don't know what you're talking about" image, but again actual usage will likely determine the appropriate behavior.

And of course, any suggestions or requests I get from other users of the app will drive future improvements.

[passenger]:http://www.modrails.com/
[rack]:http://rack.rubyforge.org/
[sinatra]:http://www.sinatrarb.com/
[twitter4r]:http://twitter4r.rubyforge.org/
