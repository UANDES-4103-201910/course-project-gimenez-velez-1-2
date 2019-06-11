class Users::RegistrationsController < Devise::RegistrationsController

  protected

  prepend_before_action :require_no_authentication, only: [:new]

  def new
    super
  end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end
