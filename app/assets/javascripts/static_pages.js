// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


//slideshow for store pictures
var numslides=0,currentslide=0;
var slides = new Array();

function MakeSlideShow() {
  	imgs=document.getElementsByTagName("img");
    for (i=0; i<imgs.length; i++) {
    	if (imgs[i].className != "buypic") continue;

    	slides[numslides]=imgs[i];
    	if (numslides==0) {
      		imgs[i].style.visibility="visible";
    	} else {
      		imgs[i].style.visibility="hidden";
    	}
    	numslides++;
  		}
	}

function NextSlide() {
  	slides[currentslide].style.visibility="hidden";
  	currentslide++;
  	if (currentslide >= numslides) currentslide = 0;
  	slides[currentslide].style.visibility="visible";
}

function PreviousSlide() {
  	slides[currentslide].style.visibility="hidden";
  	if (currentslide == 0) {
    	currentslide=1;
  	}    
  	else if (currentslide == 1){
 		currentslide=0;
  	}
  	slides[currentslide].style.visibility="visible";
	}

window.onload=MakeSlideShow;


//highlights currently active month in blog archive
var currentURL = window.location.pathname;
var aURL = currentURL.split("/",4);
var year = aURL[2];
var month = aURL[3];
var str_month

switch (month) {
  case "01": str_month = "January";
  break;
  case "02": str_month = "February";
  break;
  case "03": str_month = "March";
  break;
  case "04": str_month = "April";
  break;
  case "05": str_month = "May";
  break;
  case "06": str_month = "June";
  break;
  case "07": str_month = "July";
  break;
  case "08": srt_month = "August";
  break;
  case "09": str_month = "September";
  break;
  case "10": str_month = "October";
  break;
  case "11": str_month = "November";
  break;
  case "12": str_month = "December";
  break;
}

var years = document.getElementsByClassName("blog_year");             
for (var i = 0; i < years.length; i++) {
  var aYear = years[i];
} 
  var year_index = aYear.innerHTML.indexOf(year);
  if (years[(year_index+1)].className == "blog_year" && years[(year_index+1)].innerHTML == year) {
    var months = document.getElementsByClassName("blog_month"); 
    for (var i = 0; i < months.length; i++) {
      var aMonth = months[i];
    }
      var month_index = aMonth.innerHTML.indexOf(str_month);
      if (months[(month_index+1)].className == "blog_month" && months[(month_index+1)].innerHTML == str_month) {
        months[(month_index+1)].className = "blog_month_active";
      }
  }