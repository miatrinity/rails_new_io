require "test_helper"

class CreateRailsAppVerificationStepTest < ActiveSupport::TestCase
  def setup
    Rails.application.config.rails_new_command_template = File.open("#{Rails.root}/app/admin/development.sh.erb").read
  end

  test "'rails new' command is generated correctly" do
    app_recipe = app_recipes(:test_app)

    AutomatedVerificationStep.any_instance.stubs(:app_recipe).returns(app_recipe)

    command = CreateRailsAppVerificationStep.new.command

    assert command =~ /rails new #{app_recipe.app_name} #{app_recipe.instructions}/
  end

  def teardown
    Rails.application.config.rails_new_command_template = File.open("#{Rails.root}/app/admin/test.sh.erb").read    
  end
end
