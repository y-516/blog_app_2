class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #SessionsHelperをインクルードする事でrailsの全コントローラでSessionsHelperに記述してあるメソッドが使える
  include SessionsHelper
end
