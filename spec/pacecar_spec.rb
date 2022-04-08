# frozen_string_literal: true

require 'rails_helper'

describe Pacecar do
  it 'Is a valid module' do
    expect(described_class).to(be_a(Module))
  end
end
