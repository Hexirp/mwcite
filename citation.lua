local getArgs = require('Module:Arguments')["getArgs"]

local function user(username)
  local namespace_user = mw.site.namespaces[2].name
  local namespace_user_talk = mw.site.namespaces[3].name
  local namespace_special = mw.site.namespaces[-1].name
  local talkpagelinktext = mw.message.new("talkpagelinktext")
  local contribslink = mw.message.new("contribslink")

  return "[["..namespace_user..":"..username.."|"..username.."]] ([["..namespace_user_talk..":"..username.."|"..talkpagelinktext.."]] / [["..namespace_special..":Contributions/"..username.."|"..contribslink.."]])"
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
