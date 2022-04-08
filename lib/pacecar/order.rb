# frozen_string_literal: true

require 'active_support/concern'

module Pacecar
  module Order
    extend ActiveSupport::Concern

    included do
      define_order_scopes
    end

    module ClassMethods
      def define_order_scopes
        safe_column_names.each do |name|
          scope(
            "by_#{name}",
            lambda { |*args|
              direction = args.flatten.first || 'asc'
              order("#{name} #{direction}")
            }
          )
        end
      end
    end
  end
end
