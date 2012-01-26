class NavBar extends Spine.Controller

  events: 
    'click .nav_item'    : 'scroll_to'


  constructor: ->
    super
    @render()

  render:=>
    @append require("views/navBar")()

  scroll_to : (event)=>
    event.preventDefault()
    ele = $(event.target).attr("href")
    $('html, body').animate({scrollTop: ($(ele).offset().top - 130)}, 600);

module.exports = NavBar
