# frozen_string_literal: true

require_relative 'surfaces/version'
require_relative 'surfaces/primitive'

module Surfaces
  class Error < StandardError; end

  include Primitive

  def self.parallelogram(width, height, depth, include_inner: false)

    area = Primitive.rectangle(width, height) + Primitive.rectangle(width, depth) + Primitive.rectangle(height, depth)
    include_inner ? area * 4 : area * 2
  end

  def self.cylinder(diameter, height, side_only: false, include_inner: false)
    side_area = Primitive.rectangle(Math::PI * diameter, height)
    cap_area = Primitive.circle(diameter)
    result = side_area
    return include_inner ? result + side_area : result if side_only

    result += 2 * cap_area

    include_inner ? result * 2 : result
  end

end
