# app/controllers/admin/answered_queries_controller.rb
module Admin
  class UnansweredQueriesController < Admin::ApplicationController
    def index
      @resources = QueryProduct.all
    end
  end
end