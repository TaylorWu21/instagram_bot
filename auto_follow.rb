require "watir"
require "pry"
require "rb-readline"
require "awesome_print"
require_relative "credentials"

username = $username
password = $password
users = ["josephineskriver", "theweeknd", "kendalljenner", "karliekloss", "phambeee"]

browser = Watir::Browser.new :chrome, switches: ["--incognito"]
browser.goto "https://www.instagram.com/accounts/login/"

ap "Loggin in..."

browser.text_field(name: "username").set "#{username}"
browser.text_field(name: "password").set "#{password}"

browser.button(class: "_ah57t _84y62 _i46jh _rmr7s").click
sleep(2)

users.each { |user|
#navigate to user instagram
  browser.goto "instagram.com/#{user}/"
  #if not following then follow
  if browser.button(class: "_ah57t _84y62 _frcv2 _rmr7s").exists?
    ap "Following #{user}"
    browser.button(class: "_ah57t _84y62 _frcv2 _rmr7s").click
  elsif browser.button(class: "_ah57t _6y2ah _frcv2 _rmr7s").exists?
    # unfollow 
    ap "Unfollowing #{user}"
    browser.button(class: "_ah57t _6y2ah _frcv2 _rmr7s").click
  end
  puts "========== #{Time.now}============="
}

# binding.pry
# sleep(360)
