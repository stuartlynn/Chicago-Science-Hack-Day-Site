Sponsor     = require('models/Sponsor')

class Sponsors extends Spine.Controller
  elements :
    '#EINSTEIN' : 'EINSTEIN'
    '#NEWTON'   : 'NEWTON'
    '#KEPLER'   : 'KEPLER'
  
  levels : 
    'EINSTEIN' :  5000
    'NEWTON'   :  2000
    'KEPLER'   :  500

  constructor: ->
    super 
    @append require("views/sponsorLevels")(@levels)
    Sponsor.bind 'refresh', @render

  render:=>
    for level,value of @levels when typeof value != 'function' and value?
      @[level].prepend require("views/sponsors")([{name:"add", link:"link", logo:"add.png", level: level}])
      @[level].prepend require("views/sponsors")(Sponsor.Level(level))
      
    $('.sponsor_add').colorbox
      href : 'https://docs.google.com/spreadsheet/embeddedform?formkey=dFhZUFVLdUtsc2xZN1ZPT3BNdG9EeGc6MQ' 
      iframe:true
      innerWidth: 800
      innerHeight: 800

module.exports = Sponsors 

