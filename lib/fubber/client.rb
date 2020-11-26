require 'active_support/core_ext/module/attribute_accessors'
require 'fubber/event'

module Fubber
  mattr_accessor :api_key
  mattr_accessor :system_key
  mattr_accessor :system

  class Client
    include HTTParty

    base_uri 'https://api.followupboss.com'
    basic_auth Fubber.api_key, ''
    headers Hash[
      'Content-Type', 'application/json',
      'source', 'zoocasa',
      'X-System', Fubber.system,
      'X-System-Key', Fubber.system_key
    ]

    include Fubber::Event
  end
end
