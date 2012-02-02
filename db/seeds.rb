# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
USERS = {
  'Christian' => { 'christiannelson' => 156139 },
  'Jonah' => { 'jonah-carbonfive' => 86003 },
  'Mike' => { 'mwynholds' => 168133 },
  'Rudy' => { 'rudyjahchan' => 107783 },
  'Sean' => { 'nfiniteset' => 178653 },
  'Mike' => { 'mperham' => 2911 },
  'Jim' => { 'drtoast' => 197871 }
}

USERS.each do |name, creds|
  github_user = creds.first[0]
  github_uid = creds.first[1]
  user = User.create_from_hash!( { 'user_info' => { 'name' => name } } )
  Authentication.create_from_hash( { 'type' => 'User', 'provider' => 'github',
                                     'url' => "https://api.github.com/users/#{github_user}",
                                     'uid' => github_uid },
                                   user )
end
