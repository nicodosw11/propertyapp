// window.onload = sliderChange();
$(window).load(function(){
  if (!(page.controller() === 'deals' && page.action() === 'show')) { return; }
  return sliderChange();
})
function numberWithSpace(x) {
  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, " ");
}
function sliderChange() {
var slider = document.getElementById('slider1');
slider.addEventListener('input', sliderChange);
var amountShares =document.getElementById('box2').value;
var valuation = $('#valuation').data('valuation');
var shares = $('#shares').data('shares');
// console.log(valuation);
// console.log(shares);
var gain = $('#gain').data('gain');
// console.log(typeof gain);
// console.log(gain);
var investment = $('#investment').data('investment');
var resale = $('#resale').data('resale');
var growth = Math.round(100 * (resale / investment - 1));
// console.log(typeof growth);
// console.log(growth);
$("#sensitivity-analysis td:contains('" + gain + "')").addClass( "success" );
$("#slider-analysis td:contains('" + "+" + + growth + "%" + "')").addClass( "success" );
document.getElementById('TableSimulation11').innerHTML = numberWithSpace(Math.round(amountShares*(valuation*Math.pow((0.9925), 12))/shares));
document.getElementById('TableSimulation12').innerHTML = numberWithSpace(Math.round(amountShares*(valuation*Math.pow((1.00), 12))/shares));
document.getElementById('TableSimulation13').innerHTML = numberWithSpace(Math.round(amountShares*(valuation*Math.pow((1.0075), 12))/shares));
document.getElementById('TableSimulation14').innerHTML = numberWithSpace(Math.round(amountShares*(valuation*Math.pow((1.015), 12))/shares));
document.getElementById('TableSimulation15').innerHTML = numberWithSpace(Math.round(amountShares*(valuation*Math.pow((1.0225), 12))/shares));
document.getElementById('TableSimulation16').innerHTML = numberWithSpace(Math.round(amountShares*(valuation*Math.pow((1.03), 12))/shares));

document.getElementById('TableSimulation21').innerHTML = numberWithSpace(Math.round(amountShares*(valuation*Math.pow((0.9925), 13))/shares));
document.getElementById('TableSimulation22').innerHTML = numberWithSpace(Math.round(amountShares*(valuation*Math.pow((1.00), 13))/shares));
document.getElementById('TableSimulation23').innerHTML = numberWithSpace(Math.round(amountShares*(valuation*Math.pow((1.0075), 13))/shares));
document.getElementById('TableSimulation24').innerHTML = numberWithSpace(Math.round(amountShares*(valuation*Math.pow((1.015), 13))/shares));
document.getElementById('TableSimulation25').innerHTML = numberWithSpace(Math.round(amountShares*(valuation*Math.pow((1.0225), 13))/shares));
document.getElementById('TableSimulation26').innerHTML = numberWithSpace(Math.round(amountShares*(valuation*Math.pow((1.03), 13))/shares));

document.getElementById('TableSimulation31').innerHTML = numberWithSpace(Math.round(amountShares*(valuation*Math.pow((0.9925), 14))/shares));
document.getElementById('TableSimulation32').innerHTML = numberWithSpace(Math.round(amountShares*(valuation*Math.pow((1.00), 14))/shares));
document.getElementById('TableSimulation33').innerHTML = numberWithSpace(Math.round(amountShares*(valuation*Math.pow((1.0075), 14))/shares));
document.getElementById('TableSimulation34').innerHTML = numberWithSpace(Math.round(amountShares*(valuation*Math.pow((1.015), 14))/shares));
document.getElementById('TableSimulation35').innerHTML = numberWithSpace(Math.round(amountShares*(valuation*Math.pow((1.0225), 14))/shares));
document.getElementById('TableSimulation36').innerHTML = numberWithSpace(Math.round(amountShares*(valuation*Math.pow((1.03), 14))/shares));

document.getElementById('TableSimulation41').innerHTML = numberWithSpace(Math.round(amountShares*(valuation*Math.pow((0.9925), 15))/shares));
document.getElementById('TableSimulation42').innerHTML = numberWithSpace(Math.round(amountShares*(valuation*Math.pow((1.00), 15))/shares));
document.getElementById('TableSimulation43').innerHTML = numberWithSpace(Math.round(amountShares*(valuation*Math.pow((1.0075), 15))/shares));
document.getElementById('TableSimulation44').innerHTML = numberWithSpace(Math.round(amountShares*(valuation*Math.pow((1.015), 15))/shares));
document.getElementById('TableSimulation45').innerHTML = numberWithSpace(Math.round(amountShares*(valuation*Math.pow((1.0225), 15))/shares));
document.getElementById('TableSimulation46').innerHTML = numberWithSpace(Math.round(amountShares*(valuation*Math.pow((1.03), 15))/shares));

document.getElementById('TableSimulation51').innerHTML = numberWithSpace(Math.round(amountShares*(valuation*Math.pow((0.9925), 16))/shares));
document.getElementById('TableSimulation52').innerHTML = numberWithSpace(Math.round(amountShares*(valuation*Math.pow((1.00), 16))/shares));
document.getElementById('TableSimulation53').innerHTML = numberWithSpace(Math.round(amountShares*(valuation*Math.pow((1.0075), 16))/shares));
document.getElementById('TableSimulation54').innerHTML = numberWithSpace(Math.round(amountShares*(valuation*Math.pow((1.015), 16))/shares));
document.getElementById('TableSimulation55').innerHTML = numberWithSpace(Math.round(amountShares*(valuation*Math.pow((1.0225), 16))/shares));
document.getElementById('TableSimulation56').innerHTML = numberWithSpace(Math.round(amountShares*(valuation*Math.pow((1.03), 16))/shares));

document.getElementById('TableSimulation61').innerHTML = numberWithSpace(Math.round(amountShares*(valuation*Math.pow((0.9925), 17))/shares));
document.getElementById('TableSimulation62').innerHTML = numberWithSpace(Math.round(amountShares*(valuation*Math.pow((1.00), 17))/shares));
document.getElementById('TableSimulation63').innerHTML = numberWithSpace(Math.round(amountShares*(valuation*Math.pow((1.0075), 17))/shares));
document.getElementById('TableSimulation64').innerHTML = numberWithSpace(Math.round(amountShares*(valuation*Math.pow((1.015), 17))/shares));;
document.getElementById('TableSimulation65').innerHTML = numberWithSpace(Math.round(amountShares*(valuation*Math.pow((1.0225), 17))/shares));
document.getElementById('TableSimulation66').innerHTML = numberWithSpace(Math.round(amountShares*(valuation*Math.pow((1.03), 17))/shares));

}
