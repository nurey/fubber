require 'active_support/core_ext/module/attribute_accessors'
require 'fubber/event'
require 'fubber/person'

module Fubber
  mattr_accessor :api_key
  mattr_accessor :system_key
  mattr_accessor :system

  class Client
    include HTTParty

    base_uri 'https://api.followupboss.com'

    include Fubber::Event
    include Fubber::Person

    def initialize
      warn %{WARNING: Fubber api key not specified. Please set `Fubber.api_key = '...'`} if Fubber.api_key.nil?

      self.class.basic_auth Fubber.api_key, ''
      self.class.headers Hash[
        'Content-Type', 'application/json',
        'Source', Fubber.system,
        'X-System', Fubber.system,
        'X-System-Key', Fubber.system_key
      ]
    end
  end
end
