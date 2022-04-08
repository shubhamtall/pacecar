# frozen_string_literal: true

FactoryBot.define do
  sequence :age, &:to_i

  sequence :rating, &:to_f

  factory :comment do
    association :user
  end

  factory :mammal do
  end

  factory :post do
  end

  factory :user do
    age
    rating
  end
end
