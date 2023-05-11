$LOAD_PATH.unshift("./06caesar")

require_relative "../lib/io_test_helpers"
require "minitest/autorun"

class GradesTest < Minitest::Test
  include IoTestHelpers

  def test_convert_downcase_word
    key = "3"
    plaintext = "codeable"
    output, _error = capture_io do
      simulate_stdin(key, plaintext) { load "caesar.rb" }
    end

    assert_equal "frghdeoh", output.chomp[-plaintext.size..-1], "Test with: key: #{key}, plaintext: #{plaintext}"
  end

  def test_convert_upcase_word
    key = "3"
    plaintext = "CODEABLE"
    output, _error = capture_io do
      simulate_stdin(key, plaintext) { load "caesar.rb" }
    end

    assert_equal "FRGHDEOH", output.chomp[-plaintext.size..-1], "Test with: key: #{key}, plaintext: #{plaintext}"
  end

  def test_convert_mixed_case
    key = "3"
    plaintext = "CodeablE"
    output, _error = capture_io do
      simulate_stdin(key, plaintext) { load "caesar.rb" }
    end

    assert_equal "FrghdeoH", output.chomp[-plaintext.size..-1], "Test with: key: #{key}, plaintext: #{plaintext}"
  end

  def test_mantain_spaces_and_symbols
    key = "7"
    plaintext = "Codeable for the win!!"
    output, _error = capture_io do
      simulate_stdin(key, plaintext) { load "caesar.rb" }
    end

    assert_equal  "Jvklhisl mvy aol dpu!!",
                  output.chomp[-plaintext.size..-1],
                  "Test with: key: #{key}, plaintext: #{plaintext}"
  end

  def test_convert_key_greater_than_26
    key = "41"
    plaintext = "RubyPeru"
    output, _error = capture_io do
      simulate_stdin(key, plaintext) { load "caesar.rb" }
    end

    assert_equal "GjqnEtgj", output.chomp[-plaintext.size..-1], "Test with: key: #{key}, plaintext: #{plaintext}"
  end
end
