# frozen_string_literal: true

# This will serve as the main controller for the app
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end
