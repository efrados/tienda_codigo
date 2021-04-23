# app/controllers/admin/answered_queries_controller.rb
module Admin
  class AnsweredQueriesController < Admin::ApplicationController
    def index
      @stats = {
        customer_count: 1,
        order_count: 200,
      }
    end
  end
end