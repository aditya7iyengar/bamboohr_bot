FROM bitwalker/alpine-elixir:1.10.4

# Ensure latest versions of Hex/Rebar are installed on build
ONBUILD RUN mix do local.hex --force, local.rebar --force

WORKDIR /opt/app

COPY . .

RUN mix deps.get

CMD ["mix", "run"]
