# frozen_string_literal: true

require "bigdecimal/util"

# Areas of primitives
module Primitive
  def self.rectangle(width, height, source_unit: :mm, destination_unit: :m)
    converted_width = convert(width, source_unit, destination_unit)
    converted_height = convert(height, source_unit, destination_unit)

    converted_height * converted_width
  end

  def self.circle(diameter, source_unit: :mm, destination_unit: :m)
    converted_diameter = convert(diameter, source_unit, destination_unit)
    Math::PI * converted_diameter**2 / 4
  end

  def self.triangle_heron(side_a, side_b, side_c, source_unit: :mm, destination_unit: :m)
    converted_a = convert side_a, source_unit, destination_unit
    converted_b = convert side_b, source_unit, destination_unit
    converted_c = convert side_c, source_unit, destination_unit

    half_perimeter = (converted_a + converted_b + converted_a) / 2

    Math.sqrt(half_perimeter * (half_perimeter - converted_a) * (half_perimeter - converted_b) * (half_perimeter - converted_c))
  end

  private

  private_class_method def self.convert(value, from_unit = :mm, to_unit = :m)
    raise "One or more of given arguments are not positive" if value.negative?

    converted_value = value.to_d

    return converted_value if from_unit == to_unit

    from_unit == :mm ? converted_value / 1000 : converted_value * 1000
  end
end
