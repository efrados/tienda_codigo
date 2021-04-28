# frozen_string_literal: true

# app/controllers/admin/answered_queries_controller.rb
module Admin
  class StatisticsController < Admin::ApplicationController
    def index
      @registered_users = User.all.count - AdminUser.all.count
      @total_unanswered_questions = QueryProduct.no_response.count
      @monthly_questions_by_users = QueryProduct.monthly.by_registered_users.count
      @monthly_questions_by_visitors = QueryProduct.monthly.by_unregistered_users.count
    end

    def top_ten_fav
      @products = Product.order(fav_counter: :desc).first(10)
      @title = 'Top Ten Favorite Products'
      render 'top_index'
    end

    def top_ten_query
      @products = Product.order(query_counter: :desc).first(10)
      @title = 'Top Ten Queried Products'
      render 'top_index'
    end
  end
end
