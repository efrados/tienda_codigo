# app/dashboards/answered_query.rb
require "administrate/custom_dashboard"

class UnansweredQueryDashboard < Administrate::CustomDashboard
  resource "UnansweredQueries" # used by administrate in the views
end