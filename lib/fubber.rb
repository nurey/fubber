require 'httparty'

require 'fubber/version'
require 'fubber/client'

module Fubber
  def self.root
    File.expand_path '../..', __FILE__
  end

  def self.client
    Fubber::Client.new
  end

  class Error < StandardError; end
  # Your code goes here...
end
