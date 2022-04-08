# frozen_string_literal: true

class Mammal < ApplicationRecord

  include Pacecar

  has_many :posts, as: :owner

end
