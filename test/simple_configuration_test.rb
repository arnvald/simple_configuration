require "test_helper"
require 'ostruct'

class ProductSupplier
  extend SimpleConfiguration

  config :brand_name
  config :inventory_format, :xml
  config :participates_in_promotions, false
  config(:allows_payment_on_delivery) { |_order| true }

end

class PremiumSupplier < ProductSupplier

  brand_name "We sell premium stuff"
  inventory_format :csv
  allows_payment_on_delivery { |order| order.total_amount > 500 }

end

class StandardSupplier < ProductSupplier

  brand_name "We sell everything"
  inventory_format :json

end

class SimpleConfigurationTest < Minitest::Test

  def setup
    @supplier = ProductSupplier.new
    @premium = PremiumSupplier.new
    @standard = StandardSupplier.new
  end

  def test_that_it_has_a_version_number
    refute_nil ::SimpleConfiguration::VERSION
  end

  def test_parent_class_works
    assert_equal @supplier.inventory_format, :xml
    assert_equal @supplier.allows_payment_on_delivery(nil), true
    assert_equal @supplier.participates_in_promotions, false
    assert_raises(SimpleConfiguration::MissingConfigurationError) { @supplier.brand_name }
  end

  def test_default_settings_work
    assert_equal @premium.participates_in_promotions, false
    assert_equal @standard.allows_payment_on_delivery(nil), true
  end

  def test_overriden_simple_settings_work
    assert_equal @premium.brand_name, "We sell premium stuff"
    assert_equal @premium.inventory_format, :csv
    assert_equal @premium.participates_in_promotions, false

    assert_equal @standard.brand_name, "We sell everything"
    assert_equal @standard.inventory_format, :json
  end

  def test_block_settings_work
    cheap_order = OpenStruct.new(total_amount: 499)
    expensive_order = OpenStruct.new(total_amount: 501)

    assert_equal @premium.allows_payment_on_delivery(cheap_order), false
    assert_equal @premium.allows_payment_on_delivery(expensive_order), true
  end

end
