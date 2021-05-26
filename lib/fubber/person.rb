# frozen_string_literal: true

module Fubber
  module Person
    def find_person_by_email(email)
      self.class.get('/v1/people', query: { email: email })
    end

    def find_person_by_id(id)
      self.class.get('/v1/people', query: { id: id })
    end

    def update_person(id, person_data)
      self.class.put("/v1/people/#{id}", body: person_data.to_json)
    end
  end
end
