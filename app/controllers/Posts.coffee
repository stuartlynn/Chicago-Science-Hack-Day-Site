
Post     = require('models/Post')


class Posts extends Spine.Controller

  events:
    'click article img' : 'showPost'

  constructor: ->
    super 
    Post.bind 'create', @appendPost

  appendPost: (post)=>
    @append require('views/post')(post)
  
  showPost:   (post)=>
    @navigate('/post/#{post.id')

module.exports = Posts