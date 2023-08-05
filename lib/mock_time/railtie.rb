# frozen_string_literal: true

require_relative "./mock_time_setup"

module MockTime
  class Railtie < Rails::Railtie
    initializer "railtie.configure_rails_initialization" do
      if Rails.env.development? && MockTime.configuration.enabled?
        Time.singleton_class.prepend MockTime::MockTimeSetup
        Time.mock_time = MockTime.configuration.mock_time
      end
    end
  end
end
