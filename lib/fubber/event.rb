# frozen_string_literal: true

module Fubber
  module Event
    def find_event_by_id(id)
      find_event_by(id: id)
    end

    def find_event_by(args)
      self.class.get('/v1/events', query: args)
    end

    def create_event(event)
      self.class.post('/v1/events', body: event.to_json)
    end
  end
end
