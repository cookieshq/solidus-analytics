class IdentifyUserJob < ApplicationJob
  queue_as :default

  def perform(option)
    Analytics.identify(option)
  end
end
