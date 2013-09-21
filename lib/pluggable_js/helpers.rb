module PluggableJs
  module Helpers

    # if file exists – include it, else – call function
    def javascript_pluggable_tag
      controller = params[:controller]
      action = define_pair_action

      if File.exist?(Rails.root + "app/assets/javascripts/pluggable/#{controller}/#{action}.js.coffee")
        javascript_include_tag "pluggable/#{controller}/#{action}"
      else
        object = controller.classify

        javascript_tag "jQuery(function() { 
          if (typeof(#{object}) == 'object' && typeof(#{object}.#{action}) == 'function') { 
            return #{object}.#{action}();
          }
        });"
      end
    end

    private

    def define_pair_action
      action = params[:action]
      if Config.pair_actions.has_key?(action)
        Config.pair_actions[action]
      else
        action
      end
    end

  end
end
