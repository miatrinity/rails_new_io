# frozen_string_literal: true

# nodoc
class CustomSetupVerificationsController < ApplicationController
  def show
    @rails_bytes = params[:id].split('@')
  end
end
