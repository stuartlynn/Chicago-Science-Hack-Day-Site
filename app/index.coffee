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

  routes:
    '/': 'main'
    '/posts/:id': 'post'
  
  default: 'main'

  constructor:->
    super
    Spine.Route.setup()

    Post.fetch()
    Sponsor.fetch()



module.exports = App
    