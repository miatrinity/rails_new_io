# README

<p align="center">
  <img src="./doc/logo-wide.jpg" alt="Wide Logo">
</p>

<p align="center">
A friendly place for creating new Rails apps - YOUR way!
</p>
  
<p align="center">  
A customizable Rails app template generator with (or without!) all the bells and whistles.
</p>
  
<p align="center">    
Built with ❤️ by Trinity Takei and Mia Sinek
</p>

##  💭 Philosophy

We believe programming should spark joy. Even (especially!) the beginnings. We made railsnew.io to bring back the joy to rails app creation - whenever you want to play around with a new idea or jumps start your new project you should be able to start off with a smile instead of a grin on your face and frustration. Our aim was to get you to the fun part in just a matter of couple of clicks.

New Rails app generation has never been so easy - no headaches, just relax and take a cup of ☕ before your next Rails journey! 🎉 railsnew.io will take the heavy lifting for you so you can focus the essence rather than the noise. Think about it as your personal Rails prep chef! 🧑‍🍳

##  How it works

Sometimes generating a new Rails app can really be a pain in the ass.  No more! 🧙🏻 Check out a quick demo for a quick example of how railsnew.io works.

<p align="center">
  <img src="./doc/stimulus-demo.gif" alt="Generating Stimulus-enabled Rails app with railsnew.io">
</p>

1) ⚾️  Choose your base
2) 🏏  Add extras (or not)
3) ☕️  Lean back and enjoy!

That's it really.

## 🧩  Contributing

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
5.
## 🤝 Support
Creating takes a lot of time. We love the process and believe to give back to the community. We believe that programming should bring joy. RailsNew.io aims at just that: removing the dull stuff so that you can focus on the fun part. If find this project worthwhile, this is how you can help: Reach out. Make suggestions. Report bugs. Initiate conversations about how to improve. Invite us for a  coffee ☕️ if your around - we are always open for a good chat!

## 📬️ Mailing List
Want to stay up to date?  Subscribe to our mailing list (link it!).
We send fun emails.
And peeks behind the scenes.
No spam 🤞, really low traffic.
See you on the other side ;)
 
## 📃 Licence

is released under the MIT License [https://tldrlegal.com/license/mit-license]

