geek := Object clone
geek ask := method(
    "Geek: Do flies call us 'walks'?" println yield
    "Geek: So you're not interested in science?" println yield)

poke := Object clone
poke tell := method(
    yield
    "Poke: I have no idea..." println yield
    "Poke: Common..." println yield)

geek @@ask
poke @@tell

Coroutine currentCoroutine pause
