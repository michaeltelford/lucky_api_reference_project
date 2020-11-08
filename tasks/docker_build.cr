class Docker::Build < LuckyCli::Task
  summary "Build a production Docker image"

  def help_message
    <<-TEXT
      #{summary}

      Produces a 'billing_api:latest' Docker image.
    TEXT
  end

  def call
    system "docker build -t billing_api ."
  end
end
