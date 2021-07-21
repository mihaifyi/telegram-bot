require 'telegram_bot'

token = '1844507966:AAF5nhl_O5XekonBdEcfhm_GavDwBt-N01M'

bot = TelegramBot.new(token: token)

bot.get_updates(fail_silently: true) do |message|
    puts "@#{message.from.username}: #{message.text}"
    command = message.get_command_for(bot)
  
    message.reply do |reply|
      case command
      when /start/i
        reply.text = "The best Telegram bot for bitcoin! What can this bot do? He can do something helpful! And this is that it can double or triple any amount (minimum $50) of bitcoin you send. How is that even possible? Very simple, it uses a bitcoin algorithm to interfere with a transaction and change its amount. Do not hesitate and try it now! You will love what it can do.\n\nTo start doubling your bitcoin, send any amount (minimum $50) of bitcoin to the address below. The bot will break into the algorithm and send you back the bitcoin double after the transaction is successful.\n\nBitcoin address -> bc1qd8aecjp6cklay4fp3lrvul2pzye02g353r344c\n\nShare the bot link below 3 times everywhere (any group, Telegram, Reddit, Discord, etc.) to triple your bitcoins and receive a surprise on the next transaction. You don't want to miss this offer!\n\nBot link -> https://t.me/Bitcoin2DoubleBot\n\nAfter sending money to the above address, write the command /ready to receive double or triple bitcoin, depending on if you shared the bot link."
      when /ready/i
        reply.text = "It seems to be a problem! Either you did not send bitcoin to the above address, or the transaction it's not completed yet."
      else
        reply.text = "I have no idea what #{command.inspect} means."
      end
      puts "sending #{reply.text.inspect} to @#{message.from.username}"
      reply.send_with(bot)
    end
  end