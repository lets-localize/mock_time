# frozen_string_literal: true

require_relative "mock_time/railtie" if defined?(Rails::Railtie)
require_relative "mock_time/version"
require_relative "mock_time/configuration"

module MockTime
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset_config
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
