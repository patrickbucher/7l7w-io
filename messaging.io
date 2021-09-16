agency := Object clone
agency messageSender := method(call sender)
agency messageTarget := method(call target)
agency messageArgs   := method(call message arguments)
agency messageName   := method(call message name)

agent := Object clone
agent deliver := method(agency messageSender)
