# frozen_string_literal: true

class User < ApplicationRecord

  include Pacecar

  has_many :posts, as: :owner
  has_many :comments
  has_many :articles

end
