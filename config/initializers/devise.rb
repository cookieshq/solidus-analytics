Devise.secret_key = "727fb8ffe33d3c5e6835776fc0f3254049846308c2c647f337f1b7d437acd3c6196a666eed998964a9db20ce6c7573d882e3"

Warden::Manager.after_set_user except: :fetch do |user, auth, opts|
  Track::User.new(user).logged_in
end
