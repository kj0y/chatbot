require 'socket'
require 'cinch'


class HelloWorld
include Cinch::Plugin

match "hello".chomp.downcase
def execute(m)
    m.reply "Hello, World"
end

bot = Cinch::Bot.new do
    configure do |c|
        c.server = "irc.freenode.org"
        c.channels = ["#ChatBotBlahBlah"]
        c.port = 6667
        c.socket = TCPSocket.open(c.server,c.port)
        c.nick = 'KandisBot'
        c.plugins.plugins = [HelloWorld]
        end
    end

    bot.start

end
