class NavBar extends Spine.Controller

  events: 
    'click .nav_item'    : 'scroll_to'
    'click #shdchi'      : 'scroll_to'

  constructor: ->
    super
    @render()

  render:=>
    @append require("views/navBar")()

  scroll_to : (event)=>
    Spine.Route.navigate("/")
    event.preventDefault()
    ele = $(event.target).attr("href")
    $('html, body').animate({scrollTop: ($(ele).offset().top - 170)}, 600);

module.exports = NavBar
