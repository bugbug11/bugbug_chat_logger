local filePath = core.get_worldpath().."/chat.txt"
local fileExists

local file = io.open(filePath, "r")
if file then
    file:close()
    fileExists = true
else
    fileExists = false
end

if not fileExists then
    core.log("[bugbug_chat_logger] No chat log found, creating a new file...")
    io.open(filePath, "w"):close()
end

core.register_on_chat_message(function(name, message)
    local file = io.open(filePath, "a")
    file:write("["..os.date("%Y-%d-%m %H:%M:%S").."] ".."<"..name.."> "..message.."\n")
    return false
end)