local function trim(value)
    return (string.gsub(value, "^%s*(.-)%s*$", "%1"))
end

local function getOperatingSystem()
    local fileHandle = assert(io.popen("uname -s", 'r'))
    local commandOutput = assert(fileHandle:read('*a'))
    return commandOutput
end

local operatingSystem = trim(getOperatingSystem())

if operatingSystem == 'Darwin' then
    print("This should be Darwin")
else
    print("This is something else")
end

