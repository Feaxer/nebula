---@diagnostic disable: unused-local, lowercase-global, undefined-field
local _ = require("strings")

if not describe then
    function describe(message, callback) end
    function it(message, callback) end
end

local same = assert.are.same

describe("String methods", function()
    it("String#split", function()
        local s

        s = "foo bar baz"
        same(_.split(s, " "), { "foo", "bar", "baz" })
        same(s:split(" "), { "foo", "bar", "baz" })

        s = "foo bar"
        same(_.split(s), { "f", "o", "o", " ", "b", "a", "r" })
        same(s:split(), { "f", "o", "o", " ", "b", "a", "r" })

        s = "foo;bar;baz"
        same(_.split(s, ";"), { "foo", "bar", "baz" })
        same(s:split(";"), { "foo", "bar", "baz" })

        same(_.split(nil), {})
    end)

    it("String#at", function()
        local s = "foo bar baz"
        same(s:at(1), "f")
        same(_.at(s, 1), "f")
        same(s:at(-1), "z")
        same(_.at(s, -1), "z")
        same(s:at("bar"), 5)
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
        same(_.ends_with(s, "baz"), true)

        same(s:ends_with("bar"), false)
        same(_.ends_with(s, "bar"), false)
    end)

    it("String#starts_with", function()
        local s = "foo bar baz"
        same(s:starts_with("foo"), true)
        same(_.starts_with(s, "foo"), true)

        same(s:starts_with("bar"), false)
        same(_.starts_with(s, "bar"), false)
    end)
end)
