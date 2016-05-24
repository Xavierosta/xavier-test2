require 'open-uri'

class Locpair < ActiveRecord::Base
	def duration 
		directionsUrl = 'https://maps.googleapis.com/maps/api/directions/json?origin=&destination=&key=AIzaSyCyGxlpi-xFCFcfA7H-b339zki4DbN6ocM'
#		origin = "Toronto"
#		destination = "Montreal"
		origin = self.location1
	        destination = self.location2
		directionsUrl.insert(60, origin)
		directionsUrl.insert(73 + origin.length, destination)
		directionsRequest = open(directionsUrl) { |f| f.read }
		directions_hash = JSON.parse(directionsRequest)
		directions_hash["routes"][0]["legs"][0]["duration"]["text"]
	end
end
