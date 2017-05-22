class TrackEventJob < ApplicationJob
  queue_as :default

  def perform(option)
    Analytics.track(option)
  end
end
