module PluggableJs
  module Helpers

    module View
      def javascript_pluggable_tag
        controller = params[:controller]
        action = define_pair_action

        javascript_tag(
          "(function() {
            var pluggableFunction = window['#{controller}##{action}'];
            if (typeof(pluggableFunction) === 'function') { pluggableFunction(#{@pluggable_js_data}); }
          }).call();"
        )
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
      def pluggable_js(data)
        @pluggable_js_data = data.to_json
      end
      alias_method :pjs, :pluggable_js
    end

  end
end
