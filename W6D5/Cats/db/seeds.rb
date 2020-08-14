# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Cat.destroy_all 

catss = Cat.create([
    {name: 'Lawrence', birth_date: '1997/03/03', sex: 'M', color: 'black', description: 'Coolu dudo'},
    {name: 'Chris', birth_date: '1993/03/03', sex: 'M', color: 'white', description: 'kinda collu dudo'}

])