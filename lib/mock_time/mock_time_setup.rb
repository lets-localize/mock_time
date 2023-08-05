# frozen_string_literal: true

module MockTime
  module MockTimeSetup
    def mock_time
      @mock_time
    end

    def mock_time=(value)
      @mock_time = value
    end

    def now
      super() + mock_time
    end
  end
end
