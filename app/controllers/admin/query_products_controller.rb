# frozen_string_literal: true

module Admin
  class QueryProductsController < Admin::ApplicationController
    def default_sorting_attribute
      :created_at
    end

    def default_sorting_direction
      :desc
    end

    def scoped_resource
      search = params[resource_class.name.underscore.to_sym]
      if search && search[:custom_filter].present?
        case search[:custom_filter].to_i
        when 1
          resource_class.by_registered_users
        when 2
          resource_class.unanswered
        when 3
          resource_class.unanswered.by_registered_users
        else
          resource_class
        end
      else
        resource_class
      end
    end

    # Override this method to specify custom lookup behavior.
    # This will be used to set the resource for the `show`, `edit`, and `update`
    # actions.
    #
    # def find_resource(param)
    #   Foo.find_by!(slug: param)
    # end

    # The result of this lookup will be available as `requested_resource`

    # Override this if you have certain roles that require a subset
    # this will be used to set the records shown on the `index` action.
    #

    # Override `resource_params` if you want to transform the submitted
    # data before it's persisted. For example, the following would turn all
    # empty values into nil values. It uses other APIs such as `resource_class`
    # and `dashboard`:
    #
    # def resource_params
    #   params.require(resource_class.model_name.param_key).
    #     permit(dashboard.permitted_attributes).
    #     transform_values { |value| value == "" ? nil : value }
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information
  end
end
