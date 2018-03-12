defmodule Profiling do

  def profile_with_eprof do
	  :eprof.start

		IO.write "Bad, slow version..."
		:eprof.profile &(Profiling.run_bad/0)
		:eprof.analyze

		IO.write "\n\nGood, fast version..."
		:eprof.profile &(Profiling.run_good/0)
		:eprof.analyze

		:eprof.stop
	end

	def run_good do
		good_fib 5_000
	end

	def run_bad do
		bad_fib 5_000
	end

	defp bad_fib(n) do
		bad_fib(n, 0, 1, [])
	end

	defp bad_fib(0, _current, _next, fibs) do
		fibs
	end
	defp bad_fib(n, current, next, fibs) do
		bad_fib(n-1, next, current + next, fibs ++ [current])
	end

	defp good_fib(n) do
		good_fib(n, 0, 1, [])
	end
	
	defp good_fib(0, _current, _next, fibs) do
		Enum.reverse fibs
	end
	defp good_fib(n, current, next, fibs) do
		good_fib(n-1, next, current + next, [current|fibs])
	end
end
