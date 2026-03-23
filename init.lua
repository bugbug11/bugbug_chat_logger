local filePath = core.get_worldpath().."/chat.txt" -- Get the path for the chat log file
local fileExists -- Prepare to store wether the chat log file exists

local file = io.open(filePath, "r") -- Attempt to open the file
if file then -- File exists
    file:close()
    fileExists = true
else -- File doesn't exist
    fileExists = false
end

if not fileExists then -- The file doesn't exist, create a new file
    core.log("[bugbug_chat_logger] No chat log found, creating a new file...")
    io.open(filePath, "w"):close()
end

core.register_on_chat_message(function(name, message)
    local file = io.open(filePath, "a") -- Open the chat log file for appending
    file:write("["..os.date("%Y-%d-%m %H:%M:%S").."] ".."<"..name.."> "..message.."\n") -- Write to the chat log file
    return false
end)
