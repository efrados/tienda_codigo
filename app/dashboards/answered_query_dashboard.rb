# app/dashboards/answered_query.rb
require "administrate/custom_dashboard"

class AnsweredQueryDashboard < Administrate::CustomDashboard
  resource "AnsweredQueries" # used by administrate in the views
end