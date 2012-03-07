Spine = require('spine')

class Sponsor extends Spine.Model
  @configure 'Sponsor', 'name', 'link', 'logo', 'level'
  
  @Level :(level)=>
    (sponsor  for sponsor in @all() when sponsor.level==level)

  @fetch :->
    $.getJSON '/sponsors/sponsors.json', (data) =>
      for sponsor in data.sponsors
        s = new Sponsor(sponsor)
        s.save()
      @trigger 'refresh', @all()

 

module.exports = Sponsor