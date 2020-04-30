FROM elixir:latest

WORKDIR /usr/src/app

RUN mix local.hex --force && \
	mix local.rebar --force

ENV MIX_ENV = prod

COPY mix.exs mix.lock ./

RUN mix deps.get --only prod
RUN mix deps.compile

COPY . .
RUN mix compile

EXPOSE 80

CMD elixir --sname countme -S mix run --no-halt

