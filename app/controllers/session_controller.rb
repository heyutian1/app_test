class SessionController < ApplicationController
  skip_before_action :verify_member_auth!

  def sign_in
    return render json: {msg: "请输入账号和密码"}, status: 403 if params[:name].blank? || params[:password].blank? || params[:school_name].blank?
    @school = School.find_by(name: params[:school_name])
    return render json: {msg: "请选择学校"}, status: 403 unless @school.present?
    @member = @school.members.find_by(name: params[:name])
    return render json: {msg: "请输入正确的账号"}, status: 403 unless @member.present?
    return render json: {msg: "请输入正确的密码"}, status: 403 unless @member.password.eql?(params[:password])
  end

end
