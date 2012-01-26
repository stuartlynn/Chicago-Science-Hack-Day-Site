Spine = require('spine')
Post  = require('models/Post')
NavBar  = require('controllers/NavBar')


class PostFull extends Spine.Controller
  elements:
    '#postContent' : 'postContent'
 
  constructor: ->
    super 
    @append (new NavBar()).el.attr("id",'navbar')
    @append "<div id ='postContent'></div>"
    @append require("views/footer")()
    Post.bind 'create', =>
      @showPost()
    
  showPost:=>

    @post = Post.first()
    console.log("post is ",Post.all())
    @postContent.html require("views/postFull")(@post)

  activate:(args)=>
    super
    @currentPostId = args.id
    @showPost()

module.exports = PostFull
