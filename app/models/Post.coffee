Spine = require('spine')

class Post extends Spine.Model
  @configure 'Post', 'author', 'blurb', 'posted_at', 'text', 'mainMedia','media', 'category','title'

  @fetch :->
    $.getJSON '/posts/manifest.json', (data) =>
      @fetchPost post for post in data.posts

  @fetchPost: (url)=>
    $.getJSON "/posts/#{url}" ,(data) =>
      p = new Post(data.post)
      date = new Date(Date.parse(p.posted_at))
      p.posted_at = date
      p.save() 
  
  htmlTitle:->
    @title.replace /\s/g , "_"

  

module.exports = Post