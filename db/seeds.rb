# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

5.times do
  FactoryGirl.create(:member, lastname: "Jones")
end

4.times do
  FactoryGirl.create(:member, lastname: "Smith")
end

5.times do
  FactoryGirl.create(:member, lastname: "Perkins")
end

3.times do
  FactoryGirl.create(:member, lastname: "Rowan")
end

Member.find(4).update(type: "HomeTeacher")
Member.find(7).update(type: "HomeTeacher")
Member.find(12).update(type: "HomeTeacher")
Member.find(16).update(type: "HomeTeacher")

# works
#
comp_01 = Companionship.create
comp_01.home_teachers << HomeTeacher.all[0..1]

comp_02 = Companionship.create
comp_02.home_teachers << HomeTeacher.all[2..3]

# better
#
# create families
family_01 = Family.new
family_01.members << Member.all[0...4]

family_02 = Family.new
family_02.members << Member.all[4...9]

family_03 = Family.new
family_03.members << Member.all[9...11]

family_04 = Family.new
family_04.members << Member.all[11...16]

[family_01, family_02, family_03, family_04].map(&:save!)

comp_01.families << [family_01, family_02]
comp_02.families << [family_03, family_04]

[family_01, family_02, family_03, family_04].each do |f|
  f.surname = f.members.first.lastname
  f.save!
end
