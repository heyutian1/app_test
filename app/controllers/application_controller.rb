class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  before_action :verify_member_auth!

  helper_method :current_member, :current_school

  def current_member
    @current_member ||= Member.find_by(token: request.headers[:MemberToken])
  end

  def current_school
    @current_school ||= current_member.school
  end

  private

  def verify_member_auth!
    return render json: { msg: '请完成登录操作' }, status: 403 unless request.headers[:MemberToken].present?
  end

end
