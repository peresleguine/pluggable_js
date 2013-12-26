module PluggableJs
  class Railtie < Rails::Railtie
    initializer 'pluggable_js.helpers' do
      ActionView::Base.send :include, Helpers::View
      ActionController::Base.send :include, Helpers::Controller
    end
  end
end