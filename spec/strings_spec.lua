---@diagnostic disable: unused-local, lowercase-global, undefined-field
local _ = require("strings")

if not describe then
    function describe(message, callback) end
    function it(message, callback) end
end

local same = assert.are.same
local eq = assert.is.equal

describe("String functions", function()
    it("also available as methods", function()
        for name, value in pairs(_) do
            eq(value, string[name])
        end
    end)

    it("String#split", function()
        same(_.split("foo bar baz", " "), { "foo", "bar", "baz" })
        same(_.split("foo;;bar;;baz", ";;"), { "foo", "bar", "baz" })
        same(_.split("foo bar"), { "f", "o", "o", " ", "b", "a", "r" })
        same(_.split(nil), {})
    end)

    it("String#at", function()
        local s = "foo bar baz"
        same(_.at(s, 1), "f")
        same(_.at(s, -1), "z")
        same(_.at(s, "bar"), 5)
    end)

    it("String#__call", function()
        local s = "foo bar baz"
        same(s(5), "bar baz")
        same(s(-3), "baz")
        same(s(5, 7), "bar")
    end)

    it("String#ends_with", function()
        local s = "foo bar baz"
        same(s:ends_with("baz"), true)
        same(s:ends_with("bar"), false)
    end)

    it("String#starts_with", function()
        local s = "foo bar baz"
        same(s:starts_with("foo"), true)
        same(s:starts_with("bar"), false)
    end)
end)
