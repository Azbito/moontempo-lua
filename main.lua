local todaysTime = os.time()
local otherDateTime = os.time{year=2004, month=10, day=9}
local diff = todaysTime - otherDateTime
local differenceInYears = math.floor(diff / 60/ 60 / 24 / 365.25)

print("The difference in years is: " .. differenceInYears .. " years.")
