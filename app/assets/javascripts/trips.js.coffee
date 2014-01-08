# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
class RichMarkerBuilder extends Gmaps.Google.Builders.Marker

#	create_marker: ->
#		options = _.extend @marker_options(), @rich_marker_options()
#		@serviceObject = new RichMarker options

#	rich_marker_options: ->
#		marker = document.createElement("div")
#		marker.setAttribute 'class', 'marker_container'
#		marker.innerHTML = @args.marker_title
#		{ content: marker }

#	create_infowindow: ->
#		return null unless _.isString @args.infowindow
			    
#		boxText = document.createElement("div")
#		boxText.setAttribute("class", 'marker_infobox')
#		boxText.innerHTML = @args.infowindow
#		@infowindow = new InfoBox(@infobox(boxText))
	
#	infobox: (boxText)->
#		content: boxText
#		pixelOffset: new google.maps.Size(-140, 0)
#		boxStyle:
#			width: "280px"

@buildMap = (markers)-> 
	handler = Gmaps.build 'Google', { builders: { Marker: RichMarkerBuilder} }
	
	handler.buildMap { provider: {}, internal: {id: 'map'} }, ->
		markers = handler.addMarkers(markers)
		handler.bounds.extendWith(markers)
		handler.fitMapToBounds()
