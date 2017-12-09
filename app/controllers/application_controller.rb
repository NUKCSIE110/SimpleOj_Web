class ApplicationController < ActionController::Base
  Time.zone = 'Taipei'
  protect_from_forgery with: :exception
  include SessionsHelper
end
