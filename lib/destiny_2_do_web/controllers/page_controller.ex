defmodule Destiny2DoWeb.PageController do
  use Destiny2DoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
