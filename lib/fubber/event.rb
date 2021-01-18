# frozen_string_literal: true

module Fubber
  module Event
    def create_event(event)
      self.class.post('/v1/events', body: event.to_json)
    end
  end
end
