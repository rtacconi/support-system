# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
Status.create([{:name => 'Waiting for Staff Response'},
               {:name => 'Waiting for Customer'},
               {:name => 'On Hold'},
               {:name => 'Cancelled'}, 
               {:name =>'Completed'}])
               
u = User.new(:email => 'admin@support.com',
             :password => 'asdf123',
             :password_confirmation => 'asdf123')
u.name = 'admin'
u.save