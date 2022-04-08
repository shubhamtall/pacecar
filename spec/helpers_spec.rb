# frozen_string_literal: true

require 'rails_helper'

describe 'Helpers' do
  describe 'A class without a db table' do
    it 'Returns an empty array when asked about #safe_columns' do
      expect(Article.send(:safe_columns)).to(eq([]))
    end

    it 'Survives an include of Pacecar' do
      expect { Article.include(Pacecar) }
        .not_to(raise_error)
    end
  end

  describe 'A class with a db table' do
    it 'Returns columns for #safe_column_names' do
      expect(Comment.safe_column_names).to(eq(%w[id user_id description rating created_at updated_at]))
    end
  end

  describe 'A class with many column types' do
    it 'Returns boolean columns for #boolean_column_names' do
      expect(User.boolean_column_names).to(eq(['admin']))
    end

    it 'Returns non boolean columns for #non_boolean_column_names' do
      expect(User.non_boolean_column_names).to(
eq(
%w[
  id
  approved_at
  rejected_at
  last_posted_on
  first_name
  last_name
  description
  age
  rating
  balance
  created_at
  updated_at
]
)
)
    end

    it 'Returns text and string columns for #text_and_string_column_names' do
      expect(User.text_and_string_column_names).to(eq(%w[first_name last_name description]))
    end
  end

  describe 'A class with a state column should' do
    it 'Returns all non state text and string columns for #non_state_text_and_string_column_names' do
      expect(Post.non_state_text_and_string_columns).to(eq(%w[title body]))
    end
  end
end
