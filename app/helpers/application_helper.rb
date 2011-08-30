module ApplicationHelper
  def talk_links
    links = (current_page?(root_url) ? {} : {"Index"=>root_url})
    links.merge({
      "Cry.li Home"=>"http://cry.li/",
      "Git (1)"=>"http://cry.li/files/knowledge/git_setup/",
      "Git (2)"=>"http://cry.li/files/knowledge/git_setup/part_2.html",
      "Crydev SDK"=>"http://freesdk.crydev.net/",
      "Lua Docs" => "http://www.lua.org/manual/5.1/"
    })
  end
end
