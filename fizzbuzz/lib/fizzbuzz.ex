defmodule Fizzbuzz do
  @moduledoc """
  This module demonstrates fizzbuzz, *docs*, pattern-matching, 
  anonymous functions, ranges, the pipe-forward operator, 
  and doctest.

  Pretty sweet 
  """

  @doc """
  Play a *delightful* round of fizzbuzz. Oh, by the way
  this is a not a regular comment; this is a doc test,
  and the two examples below are unit tests.

  ## Examples
  iex> Fizzbuzz.playto(1, 5)
  [1,2,:fizz,4,:buzz]

  iex> Fizzbuzz.playto(10,16)
  [:buzz,11,:fizz,13,14,:fizzbuzz,16]
  """
  def playto(from, to) do
    from..to 
    |> Enum.map(&play/1)
  end

  defp play(num) do
    case {rem(num, 3), rem(num, 5)} do
      {0, _} -> :fizz
    	{_, 0} -> :buzz
      {0, 0} -> :fizzbuzz
    	{_, _} -> num
    end
  end
end









# For grins here is a Tweetable fizzbuzz that can be ran within iex
# 1..100|>Enum.map(&(case{rem(&1,3),rem(&1,5)}do{0,0}->:fizzbuzz;{0,_}->:fizz;{_,0}->:buzz;{_,_}->&1 end))
# for n<-1..100,do: (case{rem(n,3),rem(n,5)}do{0,0}->:fizzbuzz;{0,_}->:fizz;{_,0}->:buzz;_->n end)




# Another way to say the same...
# def playto(from, to) do
# 	from..to |> Enum.map(
# 		&(case {rem(&1,3),rem(&1,5)} do
# 				{0, 0} -> :fizzbuzz
# 				{0,_} -> :fizz
# 				{_,0} -> :buzz
# 				{_,_} -> &1
# 			end ))
# end
