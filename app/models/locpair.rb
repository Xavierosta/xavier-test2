require 'open-uri'

class Locpair < ActiveRecord::Base
	def duration 

#GOOGLE API

=begin
		directionsUrl = 'https://maps.googleapis.com/maps/api/directions/json?origin=&destination=&key=AIzaSyCyGxlpi-xFCFcfA7H-b339zki4DbN6ocM'
		origin = self.location1
	        destination = self.location2
		directionsUrl.insert(60, origin)
		directionsUrl.insert(73 + origin.length, destination)
		directionsRequest = open(directionsUrl) { |f| f.read }
		directions_hash = JSON.parse(directionsRequest)
		directions_hash["routes"][0]["legs"][0]["duration"]["text"]
=end

#BING API

		directionsUrl = 'http://dev.virtualearth.net/REST/V1/Routes?wp.0=&wp.1=&optmz=timeWithTraffic&key=AicBOv83B-hmgOH7TjKTJkOMg2iy22MaKqJeoBzJy8r3pkJMH9BYRVEAnNnW_yct'
		origin = self.location1
		destination = self.location2
		directionsUrl.insert(48, origin)
		directionsUrl.insert(54 + origin.length, destination)
		directionsRequest = open(directionsUrl) { |f| f.read }
		directions_hash = JSON.parse(directionsRequest)
		((directions_hash["resourceSets"][0]["resources"][0]["routeLegs"][0]["travelDuration"]/3600.0).round(2)).to_s + " hours"
	end
end
