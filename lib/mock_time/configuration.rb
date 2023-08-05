# frozen_string_literal: true

require "yaml"

module MockTime
  class Configuration
    attr_accessor :enabled, :mock_time

    def self.default_settings
      file_path = File.join(File.dirname(__FILE__), "default_settings.yml")
      YAML.load_file(file_path)
    end

    def initialize(settings = {}.with_defaults(default_settings))
      @enabled = !ENV["MOCK_TIME"].nil? || settings[:enabled] || false
      @mock_time = new_mock_time(settings)
    end

    def default_settings
      MockTime::Configuration.default_settings
    end

    def enabled?
      enabled
    end

    def new_mock_time(settings)
      return eval(ENV["MOCK_TIME"]) unless ENV["MOCK_TIME"].nil?
      return eval(settings[:mock_time]) if settings[:mock_time].is_a?(String)

      settings[:mock_time]
    end
  end
end
