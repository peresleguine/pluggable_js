module PluggableJs
  module Helpers

    module View
      # call function and pass data, include file if it exists
      def javascript_pluggable_tag
        controller = params[:controller]
        action = define_pair_action

        ''.tap do |content|
          content << (javascript_tag "
            (function() {
              pjs_data = {}; #{@data_string}
              jQuery(function() {
                if (typeof(window['#{controller}##{action}']) == 'function') {
                  return window['#{controller}##{action}'](pjs_data);
                }
              });
            }).call(this);"
          )

          if File.exist?(Rails.root + "app/assets/javascripts/pluggable/#{controller}/#{action}.js.coffee")
            content << (javascript_include_tag "pluggable/#{controller}/#{action}")
          end
        end.html_safe

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

    module Controller
      # convert hash passed from controller's action to data string
      def pluggable_js(hash)
        @data_string = hash.map { |key, value| "pjs_data.#{key} = #{value.to_json}" }.join('; ')
      end
      alias_method :pjs, :pluggable_js

    end

  end
end
