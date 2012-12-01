// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

	    	

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

			