Posts = require('controllers/Posts')
Sponsors = require('controllers/Sponsors')
NavBar   = require('controllers/NavBar')

class Main extends Spine.Controller
  elements:
    '#articles'       : 'articles'
    '#sponsors'       : 'sponsors'
    "#navbar"         : 'navbar'
    "#twitter"        : "twitter"
    "#photos"         : "flikr"
    ".register" : 'registerButton'

  constructor: ->
    super

    @html ( require('views/main')())

    new Posts({el:@articles})
    new Sponsors({el: @sponsors})
    new NavBar({el: @navbar})
    
    @append require("views/hacks")()

    @append require("views/footer")()

    @setUpFlickrFeed()
    @setUpTiwtterFeed()

    # $(document).scroll =>
    #   if $(document).scrollTop() > 743
    #     unless @navFixed
    #       @navFixed = true 
    #       $('#navbar').css("position","fixed") 
    #       $('#navbar').css("top","0px") 
    #       $('#lower').css("margin-top","142px")
    #   else 
    #     if @navFixed 
    #       @navFixed=false 
    #       $('#navbar').css("position","relative") 
    #       $('#lower').css("margin-top","0px")

 
    #   #remove twitter
    $(".twtr-ft").find("img").remove()
  
  setUpTiwtterFeed: ->
    @twitter.jTweetsAnywhere
      searchParams: 'q=sciencehackday OR shdchi'
      count: 4
      showTweetFeed: 
        autorefresh: 
          mode: 'trigger-insert'
          interval: 60
        showTimestamp: 
          refreshInterval: 15
            
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