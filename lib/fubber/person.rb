# frozen_string_literal: true

module Fubber
  module Person
    def find_person_by_name(name)
      find_person_by(name: name)
    end

    def find_person_by_email(email)
      find_person_by(email: email)
    end

    def find_person_by_id(id)
      find_person_by(id: id)
    end

    def find_person_by(args)
      self.class.get('/v1/people', query: args)
    end

    def update_person(id, person_data)
      self.class.put("/v1/people/#{id}", body: person_data.to_json)
    end
  end
end
