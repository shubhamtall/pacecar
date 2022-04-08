# frozen_string_literal: true

require 'rails_helper'

describe 'Navigation' do
  it 'is a valid app' do
    expect(::Rails.application).to(be_a(Pacecar::Application))
  end
end
