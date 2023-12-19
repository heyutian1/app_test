json.follows @follows do |follow|
  member = Member.find_by(id: follow.followable_id)
  next unless member.present?
  json.id follow.id
  json.created_at format_datetime(follow.created_at)

  json.member do
    json.partial! "/members/member", member: member
  end
end