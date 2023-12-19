json.followers @followers do |member|
  json.partial! "/members/member", member: member
end