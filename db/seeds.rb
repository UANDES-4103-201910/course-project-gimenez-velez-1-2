# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = [User.new(name:'Claudio', lastname:'Alvarez', \
              password:'123422312', email:'calvarez1@miuandes.cl', \
              address:'San Carlos de Apoquindo', phone: '178293845'),
         User.new(name:'Juan', lastname:'Rataplan', \
              password:'123434234', email:'jrataplan@miuandes.cl', \
              address:'San Carlos de Apoquindo',phone: '178293846'),
         User.new(name:'Raul', lastname:'Rabufetti', \
              password:'234234456', email:'rrabufetti@miuandes.cl', \
              address:'San Carlos de Apoquindo',phone: '178293849'),
         User.new(name:'Raul', lastname:'Ganfolfi', \
              password:'123412323', email:'rgandolfi@miuandes.cl', \
              address:'San Carlos de Apoquindo',phone: '178293435'),
         User.new(name:'Licenciado', lastname:'Varela', \
              password:'123423256', email:'lvarela@miuandes.cl', \
              address:'San Carlos de Apoquindo', phone: '165293845')]

for u in users do
  u.save!
end

comments = [Comment.new('mhgfjye'),Comment.new('hgfht'),Comment.new('fdsfad')]

for c in comments do
  c.save!

end
