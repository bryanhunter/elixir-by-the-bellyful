defmodule Bumper do

  @doc ~S"""
  Reads a Bitmap (24-bit) and displays width, height, and the RGB of each pixel
  """
  def show(filename) do
    {:ok, bindata} = File.read(filename)
    <<  "BM",
      _::size(64),
      offset_to_pixels::size(32)-little,
      _::size(32),
      width::size(32)-little,
      height::size(32)-little,
      _::size(16),
      24::size(16)-little,
      _rest::binary>> = bindata

    <<_::size(offset_to_pixels)-bytes, pixels::binary>> = bindata
    IO.puts "Offset:#{offset_to_pixels} Width:#{width} Height:#{height}"

    for <<b::size(8), g::size(8), r::size(8) <- pixels >>, do: {r,g,b}
  end
end

Bumper.show("krgbw.bmp")
  |> IO.inspect
