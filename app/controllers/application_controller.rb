class ApplicationController < ActionController::Base
  protect_from_forgery

  layout :layout_by_resource
  around_filter :scope_current_tenant

private

  def current_tenant
    Tenant.find_by_domain! request.domain
  end
  helper_method :current_tenant

  def current_product
    Product.find_or_create_by(:tenant_id => current_tenant.id)
  end
  helper_method :current_product

  def scope_current_tenant
    Tenant.current_id = current_tenant.id
    yield
  ensure
    Tenant.current_id = nil
  end

  protected

  def layout_by_resource
    if devise_controller?
      "application_devise"
    else
      "application"
    end
  end

end
