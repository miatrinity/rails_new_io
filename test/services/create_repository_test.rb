require "test_helper"

class AppRecipeTest < ActiveSupport::TestCase
  test "attempting to delete a non-existent repository does not raise an exception" do
    # Q: why are we testing that no exception is raised?
    # A: because a non-existent repo is a legitimate scenario
    #
    # Q: why do we care about the return value?
    # A: we don't. it's just a way to tell that we got into the
    # Github::Error::NotFound rescue branch

    assert_nothing_raised do
      result = RecreateRepository.new(repo_name: "non-existent-repo",
                                      api_token: nil).perform

      assert_equal :repo_not_found, result
    end
  end
end
