Sponsor     = require('models/Sponsor')

class Sponsors extends Spine.Controller
  elements :
    '#EINSTEIN' : 'EINSTEIN'
    '#NEWTON'   : 'NEWTON'
    '#KEPLER'   : 'KEPLER'
  
  levels : 
    'EINSTEIN' :  5000
    'NEWTON'   :  2000

  blurbs:
    'EINSTEIN' :  "Sponsors at this level get a 5-minute presentation at the start of the event, can bring promotional materials to the event, and will have their logo displayed here."
    'NEWTON'   :  "Sponsors at this level can bring promotional materials to the event and will have their logo displayed here."

  constructor: ->
    super 
    @append require("views/sponsorLevels")({levels:@levels, blurbs: @blurbs})
    Sponsor.bind 'refresh', @render

  render:=>
    for level,value of @levels when typeof value != 'function' and value?
      @[level].prepend require("views/sponsors")([{name:"add", link:"link", logo:"add.png", level: level}])
      @[level].prepend require("views/sponsors")(Sponsor.Level(level))
      
    $('.sponsor_add').colorbox
      href : 'https://docs.google.com/a/zooniverse.org/spreadsheet/embeddedform?formkey=dGpBYWRObkNMU1ZmUWFlRTBRdlBCM1E6MQ' 
      iframe:true
      innerWidth: 630
      innerHeight: 800

module.exports = Sponsors 

