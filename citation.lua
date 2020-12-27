-- 汎用的な定義

local getArgs = require('Module:Arguments')["getArgs"]

local function user(username)
  local namespace_user = mw.site.namespaces[2].name
  local namespace_user_talk = mw.site.namespaces[3].name
  local namespace_special = mw.site.namespaces[-1].name
  local talkpagelinktext = mw.message.new("talkpagelinktext"):plain()
  local contribslink = mw.message.new("contribslink"):plain()

  return "[["..namespace_user..":"..username.."|"..username.."]] ([["..namespace_user_talk..":"..username.."|"..talkpagelinktext.."]] / [["..namespace_special..":Contributions/"..username.."|"..contribslink.."]])"
end

-- 一次資料

local function cite_claim(frame)
  local username = frame[1]

  return user(username).." による[[主張]]である。"
end

local function cite_fact(frame)
  local username = frame[1]

  return user(username)..": [[広く知られた事実]]である。"
end

local function cite_obvious(frame)
  local username = frame[1]

  return user(username)..": [[自明な事柄]]である。"
end

-- 二次資料

local function cite_investigate(frame)
  local username = frame[1]
  local text = frame[2]

  return user(username).." による[[調査]]: "..text
end

-- main

local function _main(frame)
  local subcommand = {
    claim = cite_claim,
    fact = cite_fact,
    obvious = cite_obvious,
    investigate = cite_investigate,
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
