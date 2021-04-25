# app/dashboards/answered_query.rb
require "administrate/custom_dashboard"

class StatisticDashboard < Administrate::CustomDashboard
  resource "Statistic" # used by administrate in the views
end