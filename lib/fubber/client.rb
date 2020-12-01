require 'active_support/core_ext/module/attribute_accessors'
require 'fubber/event'

module Fubber
  mattr_accessor :api_key
  mattr_accessor :system_key
  mattr_accessor :system

  class Client
    include HTTParty

    base_uri 'https://api.followupboss.com'

    include Fubber::Event

    def initialize
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
