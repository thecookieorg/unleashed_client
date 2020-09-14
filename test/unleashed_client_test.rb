require_relative "test_helper"

class UnleashedClientTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::UnleashedClient::VERSION
  end
end
