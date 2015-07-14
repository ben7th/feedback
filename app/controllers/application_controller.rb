class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  # include SimpleCaptcha::ControllerHelpers
  helper :all

  before_filter :params_permit
  def params_permit
    # 由于 rails 版本升级后，要求参数 permit
    # 为了让程序暂时可以跑起来，临时添加的方法，并不安全
    params.permit!
  end
end
