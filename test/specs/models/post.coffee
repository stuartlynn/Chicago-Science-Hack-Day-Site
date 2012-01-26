describe 'Post', ->
  Post = null
  
  beforeEach ->
    class Post extends Spine.Model
      @configure 'Post'
  
  it 'can noop', ->
    