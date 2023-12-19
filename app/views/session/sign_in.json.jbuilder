json.member do
  json.partial! "/members/member", member: @member
  json.token @member.token
end

json.school do
  json.id @school.id
  json.name @school.name
end