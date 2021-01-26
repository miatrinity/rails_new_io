# frozen_string_literal: true

# nodoc
class ManualAppVerificationsController < ApplicationController
  def show
    @rails_bytes = params[:id].split('@')
  end
end
