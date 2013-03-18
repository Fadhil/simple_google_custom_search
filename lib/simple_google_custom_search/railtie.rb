require 'simple_google_custom_search/view_helpers'

module SimpleGoogleCustomSearch
  class Railtie < Rails::Railtie
    initializer "simple_google_custom_search.view_helpers" do
      ActionView::Base.send :include, ViewHelpers
    end
  end
end