# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Role.create([{ name: 'Admin' }, { name: 'MasterAdmin' }, { name: 'RegularUser' }])

regularUser = User.create({
              email: 'user@mail.com',
              password: '1234321',
              roles: [Role.find_by_name('RegularUser')]
              })

masterAdmin = User.create({
              email: 'masteradmin@mail.com',
              password: '1234321',
              roles: [Role.find_by_name('MasterAdmin')]
              })