local moontempo = {}

moontempo.version = "1.0"


function moontempo.getYearsPassed(year, month, day)
  local today = os.time()
  local other = os.time { year = year, month = month, day = day }
  local diff = os.difftime(today, other)
  local years = math.floor(diff / 60 / 60 / 24 / 365.25)

  if (moontempo.isLeapYear(other)) then
    local leapYears = math.floor(diff / 60 / 60 / 24 / 366)
    leapYears = years
    return leapYears
  end

  return years
end

function moontempo.getMonthsPassed(year, month, day)
  local today = os.time()
  local other = os.time { year = year, month = month, day = day }
  local diff = os.difftime(today, other)

  local months = diff / (60 * 60 * 24 * 29.5)
  months = math.floor(months % 12)

  return months
end

function moontempo.getDaysPassed(year, month, day)
  local today = os.time()
  local other = os.time { year = year, month = month, day = day }
  local diff = os.difftime(today, other)

  moontempo.errorMessage(diff, other, today)

  local februaryDays = moontempo.isLeapYear(year) and 29 or 28
  local monthsDays = {
    ["January"] = 31,
    ["February"] = februaryDays,
    ["March"] = 31,
    ["April"] = 30,
    ["May"] = 31,
    ["June"] = 30,
    ["July"] = 31,
    ["August"] = 31,
    ["September"] = 30,
    ["October"] = 31,
    ["November"] = 30,
    ["December"] = 31
  }

  local totalDays = math.floor(diff / 86400)
  local days = totalDays

  local maxDays = monthsDays[os.date("%B", other)]

  if days > maxDays then
    days = maxDays
  end

  if days == 31 then
    days = 1
  end

  days = math.floor(days)

  return days
end

function moontempo.isLeapYear(year)
  return (year % 4 == 0 and year % 100 ~= 0) or year % 400 == 0
end

function moontempo.getDaysInMonth(year, month)
  if month == 2 then
    return moontempo.isLeapYear(year) and 29 or 28
  else
    return ({ 31, nil, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 })[month]
  end
end

function moontempo.errorMessage(a, b, c)
  if a < 0 then
    error("Invalid date")
  end

  if b > c then
    error("Invalid date")
  end
end

return moontempo
