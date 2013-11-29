module PluggableJs
  class Railtie < Rails::Railtie
    initializer "pluggable_js.view_helpers" do
      ActionView::Base.send :include, ViewHelpers
    end

    initializer "pluggable_js.controller_helpers" do
      ActionController::Base.send :include, ControllerHelpers
    end
  end
end