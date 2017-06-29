require "watir"
require "pry"
require "rb-readline"
require "awesome_print"
require "highline/import"

puts `clear`
puts "🔥🔥🔥🔥🔥 \s TAYLOR'S DOPE ASS INSTAGRAM AUTO LIKER \s 🔥🔥🔥🔥🔥"

username = ask("Enter your Username?  ")
password = ask("Enter your password:  ") { |q| q.echo = "*" }
like_counter = 0
num_of_rounds = 0

browser = Watir::Browser.new :chrome, switches: ["--incognito"]
browser.goto "https://www.instagram.com/accounts/login/"

ap "Loggin in for you 😘"

browser.text_field(name: "username").set "#{username}"
browser.text_field(name: "password").set "#{password}"

browser.button(class: "_ah57t _84y62 _i46jh _rmr7s").click
sleep(2)

while true
  5.times do |i|
    browser.driver.execute_script("window.scrollBy(0, document.body.scrollHeight)")
    sleep(2)
  end

  if browser.span(class: "coreSpriteLikeHeartOpen").exists?
    browser.spans(class: "coreSpriteLikeHeartOpen").each { |val|
      val.click
      like_counter += 1
      sleep(1)
    }
    ap "❤️\s count: #{like_counter}"
  elsif browser.span(class: "coreSpriteHeartOpen").exists?
    browser.spans(class: "coreSpriteHeartOpen").each { |val|
      val.click
      like_counter += 1
      sleep(1)
    }
    ap "❤️\s count: #{like_counter}"
  else
    ap "No media to like yo, sorry homie"
    # exit
  end
  num_of_rounds += 1
  puts "======= #{like_counter / num_of_rounds} ❤️ \s per round (on average) =========="
  sleep(30)
end

binding.pry
