# frozen_string_literal: true

require 'active_support/concern'

module Pacecar
  module Polymorph
    extend ActiveSupport::Concern

    module ClassMethods
      def has_polymorph(name)
        scope(
          "for_#{name}_type",
          lambda { |type|
            polymorph_type = "#{name}_type"
            where(polymorph_type => type)
          }
        )
      end
    end
  end
end
