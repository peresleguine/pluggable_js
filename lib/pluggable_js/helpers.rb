module PluggableJs
  module Helpers

    module View
      def javascript_pluggable_tag
        controller = params[:controller]
        action = define_pair_action
        sc_var_name = "__should_call_#{controller.gsub(/\//, '__')}_#{action}"

        ''.tap do |content|
          content << (javascript_tag "
            (function() {
              var function_name = '#{controller}##{action}';
              var #{sc_var_name} = true;
              if (typeof(this[function_name]) == 'function' && #{sc_var_name}) {
                $(function() {
                  #{sc_var_name} = false;
                  return window[function_name](#{@pluggable_js_data});
                });
              }
            }).call(window);"
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
      def pluggable_js(hash)
        @pluggable_js_data = hash.to_json
      end
      alias_method :pjs, :pluggable_js
    end

  end
end
