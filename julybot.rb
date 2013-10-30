require "socket"

server = "chat.freenode.net"
port = "6667"
nick = "JulyBot"
channel = "#bitmaker"
greeting_prefix = "privmsg #{channel} :"
keywords = ["rain", "sun", "actuarial", "Easter", "October", "random", "left", "never"]
protein = "protein"

irc_server = TCPSocket.open(server, port)

irc_server.puts "USER bjulybot 0 * BJulyBot"
irc_server.puts "NICK #{nick}"
irc_server.puts "JOIN #{channel}"
irc_server.puts "PRIVMSG #{channel} :Hello from IRC Bot"

# July, Bot!
until irc_server.eof? do
  msg = irc_server.gets.downcase
  puts msg

  saw_word = false
  keywords.each do |g|
    saw_word = true if msg.include?(g)
  end
  saw_protein = false
  if msg.include?(protein)
    saw_protein = true
  end

  if msg.include?(greeting_prefix) and saw_word
          response = "I thought it was July"
          irc_server.puts "PRIVMSG #{channel} :#{response}"
  end
  if msg.include?(greeting_prefix) and saw_protein
    response = "Don't be a three-legged cat"
    irc_server.puts "PRIVMSG #{channel} :#{response}"
  end
end