module PluggableJs
  class Railtie < Rails::Railtie
    initializer 'pluggable_js.helpers' do
      ActionView::Base.send :include, Helpers::ViewHelpers
      ActionController::Base.send :include, Helpers::ControllerHelpers
    end
  end
end