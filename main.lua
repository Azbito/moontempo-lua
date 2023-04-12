function getYearsPassed(year, month, day)
  local today = os.time()
  local other = os.time { year = year, month = month, day = day }
  local diff = os.difftime(today, other)
  DifferenceInYears = math.floor(diff / 60 / 60 / 24 / 365.25)

  isNaN(other)

  if other > today then
    error("Invalid date")
  end

  statementLeapYear(other, diff)

  return DifferenceInYears
end

function getMonthsPassed(year, month, day)
  local today = os.time()
  local other = os.time { year = year, month = month, day = day }
  local diff = os.difftime(today, other)

  local leapYear = year % 4 == 0 and (year % 100 ~= 0 or year % 400 == 0)

  FebruaryDays = leapYear and 29 or 28
  MonthsDays = {
    ["January"] = 31,
    ["February"] = FebruaryDays,
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
  local totalDays = math.floor(diff / (1000 * 60 * 60 * 24))
  local months = 0
  local i = 1

  while i <= #MonthsDays do
    if totalDays >= MonthsDays[i] then
      totalDays = totalDays - MonthsDays[i]
      months = months + 1
    else
      break
    end
    i = i + 1
  end

  local diffMonth = math.floor((diff % 1) * 12)

  return diffMonth == 12 and 0 or month
end

function getDaysPassed(year, month, day)
  local today = os.time()
  local other = os.time { year = year, month = month, day = day }
  local diff = os.difftime(today, other)

  if diff < 0 then
    error("Invalid date")
  end

  local februaryDays = isLeapYear(year) and 29 or 28
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
  local monthNumber = tonumber(os.date("%m", other))
  local monthDays = monthsDays[os.date("%B", other)]
  local days = totalDays - monthDays + day

  if days > monthDays then
    days = days - monthDays
    monthNumber = monthNumber + 1
    monthDays = monthsDays[os.date("%B", os.time { year = year, month = monthNumber, day = 1 })]
  end

  days = math.min(days)

  return days
end

function isLeapYear(year)
  return (year % 4 == 0 and year % 100 ~= 0) or year % 400 == 0
end

function statementLeapYear(other, diff)
  if (isLeapYear(other)) then
    local years = math.floor(diff / 1000 / 60 / 60 / 24 / 366)
    return years
  end
end

function getDay(date)
  local date = tonumber(os.date("%d"))
  return date
end

function getMonth(date)
  local date = tonumber(os.date("%m"))
  return date
end

function getYear(date)
  local date = tonumber(os.date("%y"))
  return date
end

function getDaysInMonth(year, month)
  if month == 2 then
    return isLeapYear(year) and 29 or 28
  else
    return ({ 31, nil, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 })[month]
  end
end

print(getDaysPassed(2023, 04, 10))
