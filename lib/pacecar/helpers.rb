# frozen_string_literal: true

require 'active_support/concern'

module Pacecar
  module Helpers
    extend ActiveSupport::Concern

    mattr_accessor :options
    self.options = { state_pattern: /_(type|state)$/i, default_limit: 10 }

    module ClassMethods
      def safe_column_names
        safe_columns.map(&:name)
      end

      def non_boolean_column_names
        column_names_without_type(:boolean)
      end

      def boolean_column_names
        column_names_for_type(:boolean)
      end

      def text_and_string_column_names
        column_names_for_type(:text, :string)
      end

      def non_state_text_and_string_columns
        text_and_string_column_names.grep_v(Pacecar::Helpers.options[:state_pattern])
      end

      protected

      def safe_columns
        case ActiveRecord::Base.connection.adapter_name
        when 'MySQL'
          begin
            columns
          rescue Mysql::Error, ActiveRecord::StatementInvalid
            []
          end
        when 'Mysql2'
          begin
            columns
          rescue Mysql2::Error, ActiveRecord::StatementInvalid
            []
          end
        when 'SQLite', 'PostgreSQL'
          begin
            columns
          rescue ActiveRecord::StatementInvalid # If the table does not exist
            []
          end
        end
      end

      def column_names_for_type(*types)
        safe_columns.select { |column| types.include?(column.type) }
          .map(&:name)
      end

      def column_names_without_type(*types)
        safe_columns.reject { |column| types.include?(column.type) }
          .map(&:name)
      end
    end
  end
end
