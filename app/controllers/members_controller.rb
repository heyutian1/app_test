class MembersController < ApplicationController
  before_action :set_member, only: %i[ followers ]

  # GET /members or /members.json
  def index
    @members = current_school.members
    @members = @members.where(kype: params[:kype]) if params[:kype].present? 
  end

  def follow
    return render json: {msg: '请选择你要关注的人'}, status: 403 unless params[:member_id]
    current_member.follows.where(followable_type: 'Member', followable_id: params[:member_id]).first_or_create
    render json: {msg: "成功关注"}, status: 200
  end

  def unfollow
    return render json: {msg: '请选择你要取消关注的人'}, status: 403 unless params[:member_id]
    current_member.follows.where(followable_type: 'Member', followable_id: params[:member_id]).destroy_all
    render json: {msg: '取消关注'}, status: 200
  end

  def followers
    @follows = @member.follows
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find_by(id: params[:id])
    end

end
