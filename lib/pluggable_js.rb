require 'pluggable_js/version'
require 'pluggable_js/railtie' if defined?(Rails)

module PluggableJs
  DEFAULT_PAIR_ACTIONS = { 'new' => 'create', 'edit' => 'update' }
  attr_accessor :pair_actions

  def javascript_pluggable_tag
    controller = params[:controller]
    action = define_pair_action

    if File.exist?("app/assets/javascripts/pluggable/#{controller}/#{action}.js")
      javascript_include_tag "pluggable/#{controller}/#{action}"
    end
  end

  # def self.config
    
  # end

  private

    def define_pair_action
      pair_actions = DEFAULT_PAIR_ACTIONS.merge self.pair_actions

      pair_actions.each do |key, val|
        return key if params[:action] == val
      end

      params[:action]
    end
end
