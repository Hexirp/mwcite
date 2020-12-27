local function user(username)
  return "{{user|"..username.."}}"
end

local function cite_fact(frame)
  local username = frame[1]

  return user(username)..": [[広く知られた事実]]である。"
end

local function cite_obvious(frame)
  local username = frame[1]

  return user(username)..": [[自明な事柄]]である。"
end

local function main(frame)
  local subcommand = {
    fact = cite_fact,
    obvious = cite_obvious,
  }

  local cite_type = frame["type"]

  return subcommand[cite_type](frame)
end

return {main = main}
