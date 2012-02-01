Spine = require('spine')
Post  = require('models/Post')
NavBar  = require('controllers/NavBar')


class PostFull extends Spine.Controller
  elements:
    '#postContent' : 'postContent'
  events:
    'click #shdchi' : 'back'

  constructor: ->
    super 
    @append (new NavBar()).el.attr("id",'navbar')
    @append "<div id ='postContent'></div>"
    @append require("views/footer")()
    Post.bind 'create', (post)=>
      @showPost() if post.title == @currentPostName
    
  showPost:=>
    @post = Post.findByAttribute('title', @currentPostName)
    if @post
      @postContent.html require("views/postFull")(@post)
      $(".colorbox_gallery").colorbox({rel:'post_#{@post.htmlTitle()}_gal'})
    else 
      @postContent.html ("<h1 style='text-align:center; height:330px' class='error'>Could not find the post you requested</h1>")

  activate:(args)=>
    super
    $(document).scrollTop(0)
    @currentPostName = args.id.replace /_/g , " "
    @showPost()
  
  back: =>
    Spine.navigate('/') if @.active?

module.exports = PostFull
