# README

<p align="center">
  <img src="./doc/logo-wide.jpg" alt="Wide Logo">
</p>

## Contributing

### Setting up a new Menu Card

1. In the `InitialSetupController#index` action, edit the following two hashes:
   * `@omakase_state` - describes how the app is configured during the initial load. For example, this bit:
   ```
   database_choice: {
     SQLite: true,
     Postgres: false,
     MySQL: false
   }
   ```
   means that SQLite is going to be the default database choice.
   If you'd like to add a new database option, you would do it here.
   
   Do not change `rails_flags_config` (these are the 'standard' Rails flags, so they are always going to be here), but feel free to add further (sensible) menu cards as a child hash.
   
   * `@state_translation` - describes what happens when a checkbox/radio button is in a certain state. For example:
   ```
   guest_favorites: {
     spring: { true => '', false => '--skip-spring' },
     listen: { true => '', false => '--skip-listen' },
     bootsnap: { true => '', false => '--skip-bootsnap'}
   }
   ```
   This means that if the 'spring' checkbox is checked, its output will be '' (empty string); if it's not checked, the output will be '--skip-spring'. In other words, unchecking the 'spring' checkbox will result in '--skip-spring' being added to the output.
   
2. If you created a new menu card, you'll need to create a component for it.  
   
   In the case of a chexbox menu card, create the component and it's view in `app/components/main/checkbox/your_component.rb` and `app/components/main/checkbox/your_component.html.erb`, respectively.
   
   If it's a radio menu card, the correct place to put the component files is `app/components/main/radio_button/your_component.rb`, resp. `app/components/main/radio_button/your_component.html.erb`
   
   Check the contents of the other card components to see how they are set up
   
3. Render the component if you created a new one (in case you edited an existing one, you don't need to do anything).

   in `app/views/initial_setup/index.html.erb`, render your component with
   
   ```
   <%= render Tabs::Main::MenuCards::Checkbox::WhateverMyComponentDoes::Component.new(initial_state: @initial_state, state_translation: @state_translation) %>
   ```
   
4. If you created a new menu card, update the system test named 'Changing an item on every menu card is reflected in the command line output' (not specifying the file name on purpose, as it is subject to change at the time of writing). 
   

   

   
   