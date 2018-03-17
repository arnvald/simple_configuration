require "simple_configuration/version"

module SimpleConfiguration
  MissingConfigurationError = Class.new(RuntimeError)
  MISSING_VALUE = '__missing_value__'

  def config(config_name, default_value = MISSING_VALUE, &default_value_blk)

    if default_value_blk
      define_method(config_name) { |*args| instance_exec(*args, &default_value_blk) }
    elsif default_value != MISSING_VALUE
      define_method(config_name) { |*_| default_value }
    else
      define_method(config_name) { |*_| raise(MissingConfigurationError, config_name) }
    end

    define_singleton_method(config_name) do |value = nil, &blk|
      define_method(config_name) do |*args|
        blk ? instance_exec(*args, &blk) : value
      end
    end
  end

end
