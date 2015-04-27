map = new GMaps({
        div: '#map',
        lat: 51.517686,
  		lng: -0.073767
      });
     
map.addMarker({
        lat: 51.515173,
		lng: -0.077128,
        infoWindow: {
          content: '<p>Hello, I am a charity</p>'
        }
      });
