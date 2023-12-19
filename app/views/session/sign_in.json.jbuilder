json.member do
  json.partial! "/members/member", member: @member
end

json.school do
  json.id @school.id
  json.name @school.name
end