require "test_helper"

class VerificationRunsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @verification_run = admin_verification_runs(:running_ci_run)
  end

  test "should update verification_run for success" do
    patch admin_verification_run_url(@verification_run.app_recipe.app_name),
          params: { github_status: 'success' },
          headers: { "Authorization": "Token #{@verification_run.app_recipe.user.api_token}" }
          
    @verification_run.reload
    assert_equal "finished_with_success", @verification_run.state
  end
  
  test "should update verification_run for failure" do
    patch admin_verification_run_url(@verification_run.app_recipe.app_name),
          params: { github_status: 'whatever' },
          headers: { "Authorization": "Token #{@verification_run.app_recipe.user.api_token}" }
          
    @verification_run.reload
    assert_equal "finished_with_failure", @verification_run.state
  end
end

