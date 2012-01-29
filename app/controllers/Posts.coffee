Post     = require('models/Post')

class Posts extends Spine.Controller

  events:
    'click .article img' : 'showPost'
    'click .articleTitle': 'showPost'

  constructor: ->
    super 
    Post.bind 'create', @appendPost

  appendPost: (post)=>
    @append require('views/post')(post)
  
  showPost: (post)=>
    title = $(post.target).closest(".article").attr("data-title")
    @navigate("/posts/#{title}")

module.exports = Posts