# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.create_from_hash!({'user_info' => {'name' => "Jonah"}})
auth = Authentication.create_from_hash({'type'=>"User", 'url'=>"https://api.github.com/users/jonah-carbonfive", 'provider'=>"github", 'uid'=>86003}, user)