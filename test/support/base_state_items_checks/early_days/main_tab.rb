module RailsNewIo
  module BaseStateItemsChecks
    module EarlyDays
      module MainTab
        def verify_early_days_main_tab_items_checked
          # Time to Start Cooking Menu card
          refute page.find("#main-tab-base-setup-omakase").checked?
          refute page.find("#main-tab-base-setup-api").checked?
          assert page.find("#main-tab-base-setup-early").checked?
          refute page.find("#main-tab-base-setup-minimalist").checked?

          # Our Database Menu Menu card
          assert page.find("#main-tab-database-choice-sqlite").checked?
          refute page.find("#main-tab-database-choice-postgres").checked?
          refute page.find("#main-tab-database-choice-mysql").checked?

          # Guest Favorites Menu card
          refute page.find("#main-tab-guest-favorites-spring").checked?
          refute page.find("#main-tab-guest-favorites-listen").checked?
          refute page.find("#main-tab-guest-favorites-bootsnap").checked?

          # Starters Menu card
          assert page.find("#main-tab-starters-gemfile").checked?
          assert page.find("#main-tab-starters-gitignore").checked?
          refute page.find("#main-tab-starters-keep").checked?
          assert page.find("#main-tab-starters-bundle").checked?
          assert page.find("#main-tab-starters-puma").checked?

          # Mains Menu card
          refute page.find("#main-tab-mains-actiontext").checked?
          assert page.find("#main-tab-mains-activerecord").checked?
          refute page.find("#main-tab-mains-activestorage").checked?
          refute page.find("#main-tab-mains-actioncable").checked?

          # Email me Maybe (#not) Menu card
          assert page.find("#main-tab-email-actionmailer").checked?
          refute page.find("#main-tab-email-actionmailbox").checked?

          # Le Frontend Menu card
          assert page.find("#main-tab-frontend-sprockets").checked?
          refute page.find("#main-tab-frontend-javascript").checked?
          refute page.find("#main-tab-frontend-turbolinks").checked?
          refute page.find("#main-tab-frontend-webpacker").checked?
          refute page.find("#main-tab-frontend-yarn").checked?

          # Testing Menu card
          assert page.find("#main-tab-testing-minitest").checked?
          refute page.find("#main-tab-testing-system").checked?
        end

        def verify_early_days_main_tab_items_locked
          # Guest Favorites Menu card
          assert_hidden "main-tab-guest-favorites-spring-rails-byte-lock"
          assert_hidden "main-tab-guest-favorites-listen-rails-byte-lock"
          assert_hidden "main-tab-guest-favorites-bootsnap-rails-byte-lock"

          # Starters Menu card
          assert_hidden "main-tab-starters-gemfile-rails-byte-lock"
          assert_hidden "main-tab-starters-gitignore-rails-byte-lock"
          assert_hidden "main-tab-starters-keep-rails-byte-lock"
          assert_hidden "main-tab-starters-bundle-rails-byte-lock"
          assert_hidden "main-tab-starters-puma-rails-byte-lock"

          # Mains Menu card
          assert_hidden "main-tab-mains-actiontext-rails-byte-lock"
          assert_hidden "main-tab-mains-activerecord-rails-byte-lock"
          assert_hidden "main-tab-mains-activestorage-rails-byte-lock"
          assert_hidden "main-tab-mains-actioncable-rails-byte-lock"

          # Email me Maybe (#not) Menu card
          assert_hidden "main-tab-email-actionmailer-rails-byte-lock"
          assert_hidden "main-tab-email-actionmailbox-rails-byte-lock"

          # Le Frontend Menu card
          assert_hidden "main-tab-frontend-sprockets-rails-byte-lock"
          assert_hidden "main-tab-frontend-javascript-rails-byte-lock"
          assert_hidden "main-tab-frontend-turbolinks-rails-byte-lock"
          assert_hidden "main-tab-frontend-webpacker-rails-byte-lock"
          assert_hidden "main-tab-frontend-yarn-rails-byte-lock"

          # Testing Menu card
          assert_visible "main-tab-testing-minitest-rails-byte-lock"
          assert_hidden "main-tab-testing-system-rails-byte-lock"
        end
      end
    end
  end
end
