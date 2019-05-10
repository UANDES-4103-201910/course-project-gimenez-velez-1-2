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

posts = [Post.new(user_id:'1',text: 'I just hate it when big cars park on two parking spots', title: 'Horrible Parking'),
         Post.new(user_id:'1',text: 'Gas prices are rising and I cant stand it any more', title: 'Gasoline Price'),
         Post.new(user_id:'1',text: 'I cant believe how people text and drive', title: 'Texting Drivers')]
for u in users do
  u.save!
end

for j in posts do
  j.save!
end

comments = [Comment.new(text:'mhgfjye',user_id:'1',post_id:'1'),Comment.new(text:'hgfht',user_id:'1',post_id:'1'),Comment.new(text:'fdsfad',user_id:'1',post_id:'1')]

for c in comments do
  c.save!

end
