require "watir"
require "pry"
require "rb-readline"
require "awesome_print"
require_relative "credentials"

username = $username
password = $password
like_counter = 0
num_of_rounds = 0

browser = Watir::Browser.new :chrome, switches: ["--incognito"]
browser.goto "https://www.instagram.com/accounts/login/"

ap "Loggin in..."

browser.text_field(name: "username").set "#{username}"
browser.text_field(name: "password").set "#{password}"

browser.button(class: "_ah57t _84y62 _i46jh _rmr7s").click
sleep(2)

while true
  3.times do |i|
    browser.driver.execute_script("window.scrollBy(0, document.body.scrollHeight)")
    sleep(1)
  end

  if browser.span(class: "coreSpriteLikeHeartOpen").exists?
    browser.spans(class: "coreSpriteLikeHeartOpen").each { |val| 
      val.click
      like_counter += 1
    }
    ap "Photos Liked: #{like_counter}"
  else
    ap "No media to like yo, sorry homie"
  end
  num_of_rounds += 1
  puts "=======#{like_counter / num_of_rounds} likes per round (on average) =========="
  sleep(30)
end

binding.pry