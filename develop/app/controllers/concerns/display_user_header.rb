module DisplayUserHeader
  extend ActiveSupport::Concern

  def set_header
    @header = 'layouts/user_header'
  end
end