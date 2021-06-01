# frozen_string_literal: true

module Fubber
  module User
    def find_user_by_id(id)
      self.class.get('/v1/users', query: { id: id })
    end
  end
end
