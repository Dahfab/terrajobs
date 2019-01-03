# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create(:name => "GIS", :slug => "gis-jobs")
Category.create(:name => "Geographie", :slug => "geographie-jobs")
Category.create(:name => "Geologie", :slug => "geologie-jobs")
Category.create(:name => "Vermessung", :slug => "vermessung-jobs")
Category.create(:name => "Green-Jobs", :slug => "green-jobs")
Category.create(:name => "Sonstige", :slug => "sonstige-jobs")