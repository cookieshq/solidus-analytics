class Track::User
  def initialize(user)
    @user = user
  end

  def logged_in
    identify_user

    TrackEventJob.perform_later(
      {
        user_id: @user.id,
        event: 'Sign In User'
      }
    )
  end

  def identify_user
    IdentifyUserJob.perform_later(
      {
        user_id: @user.id,
        traits: {
          email: @user.email
        }
      }
    )
  end
end
