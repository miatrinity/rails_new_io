module RailsNewIo
  module BaseStateItemsChecks
    module EarlyDays
      module MainTab
        def verify_early_days_main_tab_items_checked
          # Time to Start Cooking Menu card
          refute page.find('#main-tab-base-setup-omakase').checked?
          refute page.find('#main-tab-base-setup-api').checked?
          assert page.find('#main-tab-base-setup-early').checked?
          refute page.find('#main-tab-base-setup-minimalist').checked?

          # Our Database Menu Menu card
          assert page.find('#main-tab-database-choice-sqlite').checked?
          refute page.find('#main-tab-database-choice-postgres').checked?
          refute page.find('#main-tab-database-choice-mysql').checked?

          # Guest Favorites Menu card
          refute page.find('#main-tab-guest-favorites-spring').checked?
          refute page.find('#main-tab-guest-favorites-listen').checked?
          refute page.find('#main-tab-guest-favorites-bootsnap').checked?

          # Starters Menu card
          assert page.find('#main-tab-starters-gemfile').checked?
          assert page.find('#main-tab-starters-gitignore').checked?
          refute page.find('#main-tab-starters-keep').checked?
          assert page.find('#main-tab-starters-bundle').checked?
          assert page.find('#main-tab-starters-puma').checked?

          # Mains Menu card
          refute page.find('#main-tab-mains-actiontext').checked?
          assert page.find('#main-tab-mains-activerecord').checked?
          refute page.find('#main-tab-mains-activestorage').checked?
          refute page.find('#main-tab-mains-actioncable').checked?

          # Email me Maybe (#not) Menu card
          assert page.find('#main-tab-email-actionmailer').checked?
          refute page.find('#main-tab-email-actionmailbox').checked?

          # Le Frontend Menu card
          assert page.find('#main-tab-frontend-sprockets').checked?
          refute page.find('#main-tab-frontend-javascript').checked?
          refute page.find('#main-tab-frontend-turbolinks').checked?
          refute page.find('#main-tab-frontend-webpacker').checked?
          refute page.find('#main-tab-frontend-yarn').checked?

          # Testing Menu card
          assert page.find('#main-tab-testing-minitest').checked?
          refute page.find('#main-tab-testing-system').checked?
        end

        def verify_early_days_main_tab_items_locked
          # Guest Favorites Menu card
          assert_hidden 'main-tab-guest-favorites-spring-railsbyte-lock'
          assert_hidden 'main-tab-guest-favorites-listen-railsbyte-lock'
          assert_hidden 'main-tab-guest-favorites-bootsnap-railsbyte-lock'

          # Starters Menu card
          assert_hidden 'main-tab-starters-gemfile-railsbyte-lock'
          assert_hidden 'main-tab-starters-gitignore-railsbyte-lock'
          assert_hidden 'main-tab-starters-keep-railsbyte-lock'
          assert_hidden 'main-tab-starters-bundle-railsbyte-lock'
          assert_hidden 'main-tab-starters-puma-railsbyte-lock'

          # Mains Menu card
          assert_hidden 'main-tab-mains-actiontext-railsbyte-lock'
          assert_hidden 'main-tab-mains-activerecord-railsbyte-lock'
          assert_hidden 'main-tab-mains-activestorage-railsbyte-lock'
          assert_hidden 'main-tab-mains-actioncable-railsbyte-lock'

          # Email me Maybe (#not) Menu card
          assert_hidden 'main-tab-email-actionmailer-railsbyte-lock'
          assert_hidden 'main-tab-email-actionmailbox-railsbyte-lock'

          # Le Frontend Menu card
          assert_hidden 'main-tab-frontend-sprockets-railsbyte-lock'
          assert_hidden 'main-tab-frontend-javascript-railsbyte-lock'
          assert_hidden 'main-tab-frontend-turbolinks-railsbyte-lock'
          assert_hidden 'main-tab-frontend-webpacker-railsbyte-lock'
          assert_hidden 'main-tab-frontend-yarn-railsbyte-lock'

          # Testing Menu card
          assert_visible 'main-tab-testing-minitest-railsbyte-lock'
          assert_hidden 'main-tab-testing-system-railsbyte-lock'
        end
      end
    end
  end
end
