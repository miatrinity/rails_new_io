module RailsNewIo
  module BaseStateItemsChecks
    module Omakase
      module ClassicsTab
        def verify_omakase_classics_tab_items_checked
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

        def verify_omakase_classics_tab_items_active
          # Testing Framework Menu Card
          refute_active_rails_byte('classics-tab-testing-none')
          assert_active_rails_byte('classics-tab-testing-minitest')
          refute_active_rails_byte('classics-tab-testing-rspec')

          # Frontend Framework Menu Card
          assert_active_rails_byte('classics-tab-frontend-none')
          refute_active_rails_byte('classics-tab-frontend-stimulus')
          refute_active_rails_byte('classics-tab-frontend-stimulus-reflex')

          # CSS Framework Menu Card
          assert_active_rails_byte('classics-tab-css-none')
          refute_active_rails_byte('classics-tab-css-tailwind')
          refute_active_rails_byte('classics-tab-css-bootstrap')
        end
      end
    end
  end
end
