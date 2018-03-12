defmodule MikeCheck do
  def run(how_many_generations) do
		runner = 	fn -> 
								live_full_life(how_many_generations, self()) 
						 	end

		{microseconds, :done} = :timer.tc(runner)
		IO.puts "\nElapsed: #{microseconds/1_000_000}"
	end
	
	def live_full_life(0, runner_pid) do
		# Last one. Send an 'ok' to the first pid (runner_pid) in the chain.
		send runner_pid, :ok
	end

	def live_full_life(how_many_more, runner_pid) do
		# 1- Create a child process that runs `live_full_life` (this same function)
		child_pid = spawn(fn -> live_full_life(how_many_more - 1, runner_pid) end)

		# 2- Send an 'ok' message to our child process
		send(child_pid, :ok)

		# 3- Wait at the mailbox until we receive an 'ok' message (from our parent).
		receive do
			:ok -> :done
		end
	end
end
