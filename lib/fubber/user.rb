# frozen_string_literal: true

module Fubber
  module User
    def find_user_by_name(name)
      find_user_by(name: name)
    end

    def find_user_by_id(id)
      find_user_by(id: id)
    end

    def find_user_by(args)
      self.class.get('/v1/users', query: args)
    end
  end
end
