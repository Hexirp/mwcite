local getArgs = require('Module:Arguments')["getArgs"]

local function user(username)
  return "[[{{ns:2}}:"..username.."|"..username.."]] ([[{{ns:3}}:"..username.."|{{int:talkpagelinktext}}]] / [[{{ns:-1}}:Contributions/"..username.."|{{int:contribslink}}]])"
end

local function cite_fact(frame)
  local username = frame[1]

  return user(username)..": [[広く知られた事実]]である。"
end

local function cite_obvious(frame)
  local username = frame[1]

  return user(username)..": [[自明な事柄]]である。"
end

local function _main(frame)
  local subcommand = {
    fact = cite_fact,
    obvious = cite_obvious,
  }

  local cite_type = frame["type"]

  return subcommand[cite_type](frame)
end

local function main(frame)
  local args = getArgs(frame)

  return _main(args)
end

return {
  main = main,
  _main = _main,
}
