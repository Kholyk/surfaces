# frozen_string_literal: true

require "test_helper"

class TestSurfaces < Minitest::Test
  def setup
    @box = { width: 1000, height: 1000, depth: 1000 }
    @cyl = { diameter: 133, height: 940 }
  end

  def test_that_it_has_a_version_number
    refute_nil ::Surfaces::VERSION
  end

  def test_it_calculate_parallelogram
    assert Surfaces.parallelogram(@box[:width], @box[:height], @box[:depth]) == 6
    assert Surfaces.parallelogram(@box[:width], @box[:height], @box[:depth], include_inner: true) == 12
  end

  def test_calculate_cylinder
    assert_equal(0.421, Surfaces.cylinder(@cyl[:diameter], @cyl[:height]).round(3))
    assert_equal(0.841, Surfaces.cylinder(@cyl[:diameter], @cyl[:height], include_inner: true).round(3))
    assert_equal(0.393, Surfaces.cylinder(@cyl[:diameter], @cyl[:height], side_only: true).round(3))
    assert_equal(0.786, Surfaces.cylinder(@cyl[:diameter], @cyl[:height], side_only: true, include_inner: true).round(3))
  end
end
