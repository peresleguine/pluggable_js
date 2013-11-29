require 'pluggable_js/version'
require 'pluggable_js/view_helpers'
require 'pluggable_js/controller_helpers'
require 'pluggable_js/config'
require 'pluggable_js/railtie' if defined?(Rails)

module PluggableJs
  def self.config(&block)
    block.call(Config)
  end
end
