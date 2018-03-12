defmodule Hot do
  ## API
  def start do
    spawn(fn -> loop(0) end)
  end

  def stop(pid) do
    Process.send(pid, :stop, [])
  end

  ## Backend server loop 
  def loop(uptime) do
    IO.puts "#{node()}: #{uptime} years of bug-free uptime****"
    receive do
      :stop ->
        IO.puts "Stopping Hot..."
        exit(:normal)
      after 2_000 ->
        :ok
    end
    
    Hot.loop(uptime + 1)
  end
end




# Node.spawn(:"dog@127.0.0.1", fn -> Hot.start() end)