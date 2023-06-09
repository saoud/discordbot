require 'discordrb'

class DiscordBot < Discordrb::Commands::Bot

  def initialize(token)
    super(token)
  end

  def start
    # Start listening for messages
    on :message do |event|
      # Check if the message is a command
      if event.content.start_with?('!')
        # Handle the command
        handle_command(event)
      else
        # Send a reply to the message
        event.respond(event.content)
      end
    end

    # Start the bot
    run
  end

  private

  def handle_command(event)
    # Check the command and take action
    case event.content
    when '!shoutout'
      shoutout(event.user)
    when '!hug'
      hug(event.user)
    else
      # Unknown command
      event.respond("I don't know how to handle that command.")
    end
  end

  def shoutout(user)
    # Send a shoutout to the user
    event.channel.send("Hey #{user.name}, thanks for watching!")
  end

  def hug(user)
    # Send a hug to the user
    event.channel.send("Hug! <3")
  end

end

# Create a new bot
bot = DiscordBot.new('your_token')

# Start the bot
bot.start

