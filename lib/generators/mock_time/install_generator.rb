# frozen_string_literal: true

require "rails/generators"

module MockTime
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path("templates", __dir__)
      desc "Create Mock Time Initializer"

      def create_install_file
        template "mock_time.rb", "config/initializers/mock_time.rb"
      end
    end
  end
end
