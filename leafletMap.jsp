<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>leafletMap</title>
	<link rel="stylesheet" href="https://unpkg.com/leaflet@1.0.3/dist/leaflet.css" />
	<script src="https://unpkg.com/leaflet@1.0.3/dist/leaflet.js"></script>
  </head>
  
  <body>
  <div>
    <div id="map" style="width: 100%; height: 100%;position: absolute;z-index:1" ></div>
    <div id=infoView style="margin-top: 10%;margin-left: 2%;width:26% ;position: absolute;background: #fff;z-index:2"  ></div>
 
    <script type="text/javascript">
    	var mymap = L.map('map',{doubleClickZoom:false,closePopupOnClick:false}).setView([39.9,116.3],11);
    	L.tileLayer('http://map.zhtu.net:8080/r3t-basemap/{z}/{x}/{y}/tile.jpg').addTo(mymap);
    	L.control.scale({position:'topright'}).addTo(mymap);
    	
    	var list=[];
    	var polyline;
    	var div = document.getElementById("infoView");
    	
    	mymap.on('dblclick',dblclick);
    	function dblclick(e){
    		L.marker([e.latlng.lat,e.latlng.lng]).addTo(mymap).bindTooltip(e.latlng.lat+','+e.latlng.lng,{direction:'top',permanent:true}).openTooltip;
    		list.push(e.latlng);
    		polyline = L.polyline(list,{color:'red'}).addTo(mymap);
    		mymap.fitBounds(polyline.getBounds());
    		div.innerHTML=listView(list);
    	}
    	function listView(list){
    		var str='';
    		for(var i=0;i<list.length;i++){			
    			str+= 'No.'+(i+1)+' '+list[i].lat+','+list[i].lng+'<br>';
    		}
    		return str;
    	}
    </script>
   </div>
  </body>
</html>
