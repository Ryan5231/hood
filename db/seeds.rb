
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


hoods = ["Alamo Square", "Anza Vista", "Ashbury Heights", "Balboa Terrace", "Bayview-Hunters Point", "Bernal Heights", "Castro", "Chinatown", "Civic Center", "Cole Valley", "Corona Heights", "Crocker-Amazon", "Diamond Heights", "Dogpatch", "Duboce Triangle", "Embarcadero", "Excelsior", "Fillmore", "Financial District", "Fisherman's Wharf", "Forest Hill", "Glen Park", "Hayes Valley", "Ingleside", "Ingleside Heights", "Ingleside Terraces", "Inner Richmond", "Inner Sunset", "Japantown", "Lakeshore", "Lakeside", "Laurel Heights", "Lower Haight", "Lower Pacific Heights", "Marina/Cow Hollow", "Merced Heights", "Merced Manor", "Miraloma Park", "Mission", "Mission Bay", "Mission Terrace", "Monterey Heights", "Mount Davidson Manor", "NoPa", "Nob Hill", "Noe Valley", "North Beach/Telegraph Hill", "Oceanview", "Outer Mission", "Outer Richmond", "Outer Sunset", "Pacific Heights", "Parkmerced", "Parkside", "Portola", "Potrero Hill", "Presidio", "Presidio Heights", "Russian Hill", "Sea Cliff", "Sherwood Forest", "SoMa", "St Francis Wood", "Stonestown", "Sunnyside", "Tenderloin", "The Haight", "Twin Peaks", "Union Square", "Visitacion Valley", "West Portal", "Western Addition", "Westwood Highlands", "Westwood Park"]

hoods.each do |h|
  Neighborhood.find_or_create_by_name(h)
end

# Create a single listing
title = "Charming Strip Mall"
description =  Faker::Lorem.sentences(2).join(" ")
address = Faker::Address.street_address
neighborhood = Neighborhood.find(10)
listing = Listing.create(title: title, description: description, address: address, neighborhood_id: 1, realtor_id: 3)

#Create choices for listing
5.times do
  listing = Listing.first
  choice = Choice.create(content: Faker::Lorem.words(5).join(" "))
  listing.choices << choice
  listing.save
end



