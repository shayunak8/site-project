<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="WebApplication3.aspx_pages.Gallery" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Gallery</title>
    <link href="../styles/navigation.bar.css" rel="stylesheet" />
    <link href="../styles/pics.css" rel="stylesheet" />
    <link href="../styles/Text.css" rel="stylesheet" />
    <script src="../javascript/Form.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<style>
* {box-sizing: border-box}
body {font-family: Verdana, sans-serif; margin:0}
.mySlides {display: none}
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 24px;
  margin-top: -22px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 100px;
  border-radius: 3px 0 0 3px;
}
.prev {
  left: 100px;
  border-radius: 3px 0 0 3px;
}
/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}
@media only screen and (max-width: 300px) {
  .prev, .next,.text {font-size: 11px}
}
</style>
    <script>

</script>
</head>
<body onload="startTime(); date()">
    <ul>
      <li><a href="Home.aspx">Home</a></li>
        <li><a href="Sign.in.aspx">logout</a> </li> 
        <li><a href="About.aspx">About</a></li>
        <li><a href="Links.aspx">links</a></li>
        <li><a href="Acount.aspx">Acount</a></li>
        <li><div style="color: red"><br /> <% Response.Write(Session["User"]); %></div></li>
        <li><div id="date2" style="color: white"></div></li>  
        <li><div id="txt" style="color: white"></div></li>      
    </ul>  
    <h2>pictures</h2>
    <br />  
<div class="slideshow-container">
<div class="mySlides fade">
  <div class="numbertext">1 / 3</div>
    <img src="../Media/Pictures/Riddle1.jpg" style="width:80%"/>
</div>

<div class="mySlides fade">
  <div class="numbertext">2 / 3</div>
    <img src="../Media/Pictures/Riddle2.jpg" style="width:80%"/>
</div>

<div class="mySlides fade">
  <div class="numbertext">3 / 3</div>
    <img src="../Media/Pictures/Riddle.jpeg" style="width:80%"/>
</div>

<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
<a class="next" onclick="plusSlides(1)">&#10095;</a>

</div>
<br/>

<div style="text-align:center">
  <span class="dot" onclick="currentSlide(1)"></span> 
  <span class="dot" onclick="currentSlide(2)"></span> 
  <span class="dot" onclick="currentSlide(3)"></span> 
</div>

<script>
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
}
</script>

</body>
</html>