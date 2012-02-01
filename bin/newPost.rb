require 'json'

File.open("#{ARGV[0].json}", "w") do |f| 

  post = { "post"=> 
        { "title"=> ARGV[0],
          "text"=> " <p>Add test in here</p>",
          "mainMedia"=> "",
          "media"=> ["/images/hackdaylogo.png"],
          "blurb"=> "",
          "author"=> "Stuart",
          "posted_at"=> Time.now,
          "category"=> "not used just now"
      }
  }

  f.puts JSON.prettyGenerate post
end



