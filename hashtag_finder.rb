require "watir"
require "pry"
require "rb-readline"
require "awesome_print"
require_relative "credentials"

username = $username
password = $password
hashtags = ["#yolo", "#code", "#"]
like_counter = 0
num_of_rounds = 0

browser = Watir::Browser.new :chrome, switches: ["--incognito"]
browser.goto "https://www.instagram.com/accounts/login/"

ap "Loggin in..."

browser.text_field(name: "username").set "#{username}"
browser.text_field(name: "password").set "#{password}"

browser.button(class: "_ah57t _84y62 _i46jh _rmr7s").click
sleep(2)

browser.text_field(class: "_9x5sw _qy55y").set "yolo"
browser.a(class: "_k2vj6").click

#Like only one
browser.a(class: "_8mlbc _vbtk2 _t5r8b").click
browser.span(class: "coreSpriteLikeHeartOpen").click
browser.button(class: "_3eajp").click
like_counter += 1

# browser.as(class: "_8mlbc _vbtk2 _t5r8b").each do |pic|
#   binding.pry
#   pic.click
#   if pic.span(class: "_soakw coreSpriteLikeHeartOpen")
#     browser.span(class: "_soakw coreSpriteLikeHeartOpen").click
#     browser.button(class: "_3eajp").click
#     like_counter += 1
#   else
#     browser.button(class: "_3eajp")
#   end
# end
ap "#{like_counter} photos liked"


sleep(40)