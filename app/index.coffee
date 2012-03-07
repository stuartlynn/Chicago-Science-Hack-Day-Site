require('lib/setup')

Spine     = require('spine')
Main      = require('controllers/main')
PostFull  = require('controllers/postFull')

Post      = require('models/Post')
Sponsor   = require('models/Sponsor')

class App extends Spine.Stack
  controllers:
    main : Main
    post : PostFull
  
  elements: 
    ".register" : 'registerButton'
  routes:
    '/': 'main'
    '/posts/:id': 'post'
  
  default: 'main'

  constructor:->
    super
    Spine.Route.setup()
   
    $(window).bind "hashchange", =>
      if window.location.hash == ""
        @navigate('/') 
    
    $(@registerButton).colorbox
      href : 'https://docs.google.com/spreadsheet/embeddedform?formkey=dFhZUFVLdUtsc2xZN1ZPT3BNdG9EeGc6MQ' 
      iframe:true
      innerWidth: 620
      innerHeight: 600  

    Post.fetch()
    Sponsor.fetch()

module.exports = App
    