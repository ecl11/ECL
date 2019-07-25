module DisplayAdminHeader
  extend ActiveSupport::Concern

  def set_header
    @header = 'layouts/admin_header'
  end
end