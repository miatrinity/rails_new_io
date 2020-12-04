module Shared
  module Navbar
    class Component < ViewComponent::Base
      def initialize
        @items = { 
          '🏠️ Home': '', 
          '🤔 Why?': 'why', 
          '📽️ Live Demo': 'live-demo',
          '📨 About / Contact': 'about'
          }
      end

      def sitcky_or_not(controller_name)
        return '' unless controller_name == 'pages'

        'sticky top-0'
      end
    end
  end
end
