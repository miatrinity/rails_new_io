app_recipe = AppRecipe.create(
  title: "Stimulus + RSpec + Tailwind",
  instructions: "stimulus_rspec_tailwind --skip-test --template https://www.railsbytes.com/script/Xo5s9m",
  description: "Simple Template with Stimulus, RSpec, and Tailwind"
)

app_recipe.verification_runs.create(
  status: "success",
  finished_at: Time.current
)
