# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Devsphere::Application.initialize!

TALK_LINKS = {
  "Cry.li Homepage"=>"http://cry.li/",
  "CryENGINE3 Documentation"=>"http://freesdk.crydev.net/",
  "Lua Documentation" => "http://www.lua.org/manual/5.1/"
}