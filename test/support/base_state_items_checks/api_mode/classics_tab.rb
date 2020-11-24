module RailsNewIo
  module BaseStateItemsChecks
    module ApiMode
      module ClassicsTab
        def verify_api_mode_classics_tab_items_checked
          # Testing Framework Menu Card
          refute page.find('#classics-tab-testing-none').checked?
          assert page.find('#classics-tab-testing-minitest').checked?
          refute page.find('#classics-tab-testing-rspec').checked?

          # Frontend Framework Menu Card
          assert page.find('#classics-tab-frontend-none').checked?
          refute page.find('#classics-tab-frontend-stimulus').checked?
          refute page.find('#classics-tab-frontend-stimulus-reflex').checked?

          # CSS Framework Menu Card

          assert page.find('#classics-tab-css-none').checked?
          refute page.find('#classics-tab-css-tailwind').checked?
          refute page.find('#classics-tab-css-bootstrap').checked?
        end
      end
    end
  end
end
