Posts = require('controllers/Posts')
Sponsors = require('controllers/Sponsors')
NavBar   = require('controllers/NavBar')

class Main extends Spine.Controller
  elements:
    '#articles' : 'articles'
    '#sponsors' : 'sponsors'
    "#navbar"   : 'navbar'
    "#twitter"  : "twitter"
    "#photos"    : "flikr"
  constructor: ->
    super

    @html ( require('views/main')())

    new Posts({el:@articles})
    new Sponsors({el: @sponsors})
    new NavBar({el: @navbar})
    
    
    @append require("views/footer")()

    @setUpFlickrFeed()
    
    $(document).scroll =>
      if $(document).scrollTop() > 823
        unless @navFixed
          @navFixed = true 
          $('#navbar').css("position","fixed") 
          $('#navbar').css("top","0px") 
          $('#lower').css("margin-top","135px")
      else 
        if @navFixed 
          @navFixed=false 
          $('#navbar').css("position","relative") 
          $('#lower').css("margin-top","0px")
      
      #remove twitter
    $(".twtr-ft").find("img").remove()
  
  @setUpTiwtterFeed: ->
    twtr = new TWTR.Widget
      version: 2
      type: 'search'
      search: 'chiscihd OR sciencehackday'
      interval: 30000
      title: 'Science Hack Day Chicago'
      subject: ''
      width: 'auto'
      height: 300
      theme:
        shell:
          background: '#ffffff'
          color: '#ffffff'
        tweets:
          background: '#ffffff'
          color: '#444444'
          links: '#444444'
      features:
        scrollbar: false
        loop: false
        live: true
        behavior: 'all'
    twtr.render().start();

  setUpFlickrFeed:=>

    @flikr.jflickrfeed
      limit: 9
      flickrbase: 'http://api.flickr.com/services/feeds/'
      feedapi: "groups_pool.gne"
      qstrings: 
        id: '1463326@N23'
      itemTemplate: 
        '<li style="display:inline-blocl"><a href="{{image_b}}"><img src="{{image_s}}" alt="{{title}}" /></a></li>'




   
module.exports =  Main