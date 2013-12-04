module PluggableJs
  module Helpers

    module ViewHelpers
      # include file if it exists or pass data and call a function
      def javascript_pluggable_tag
        controller = params[:controller]
        action = define_pair_action

        if File.exist?(Rails.root + "app/assets/javascripts/pluggable/#{controller}/#{action}.js.coffee")
          javascript_include_tag "pluggable/#{controller}/#{action}"
        else
          javascript_tag "
            #{@js_data_string}
            jQuery(function() {
              if (typeof(#{controller}) == 'object' && typeof(#{controller}['#{action}']) == 'function') { 
                return #{controller}['#{action}']();
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

    module ControllerHelpers
      # convert hash, passed from controller's action, to js data string
      def pluggable_js(hash)
        data_string = hash.map do |key, value|
          value = if value.is_a?(String)
            "'#{value}'"
          elsif value.is_a?(Hash)
            value.to_json
          else
            value
          end
          "pluggable_js.#{key} = #{value};"
        end.join(' ')
        @js_data_string = 'window.pluggable_js = {}; ' + data_string
      end
      
    end

  end
end
