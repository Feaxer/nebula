---@diagnostic disable: unused-local, lowercase-global, discard-returns
local exports = {}
local string_methods = {}

function exports.split(str, sep)
    if type(str) ~= "string" then
        return {}
    end
    if sep == nil then
        sep = "."
    else
        sep = "([^" .. sep .. "]+)"
    end
    local result = {}
    str:gsub(sep, function(m)
        table.insert(result, m)
    end)
    return result
end

function exports.at(str, i)
    if type(i) == "number" then
        return string.sub(str, i, i)
    else
        return string.find(str, i)
    end
end

getmetatable("").__call = function(str, i, j)
    if type(i) == "string" then
        return string.match(str, i)
    end
    if type(i) == "number" then
        return string.sub(str, i, j)
    end
end

function exports.ends_with(str, text)
    return string.match(str, text .. "$") ~= nil
end

function exports.starts_with(str, text)
    return string.match(str, "^" .. text) ~= nil
end
---------------------------------
-- Adding string methods
---------------------------------

for key, value in pairs(exports) do
    string[key] = value
end

return exports
