-- Function:
Switch = setmetatable({}, {
    __call = function(_, val)
        return setmetatable({val = val}, {
            __call = function(self, t)
                return (t[self.val] or t.default or function() end)()
            end
        })
    end
})

-- Ussage:
local fruit = "banana"

Switch(fruit) {
    apple  = function() print("🍎 This is an apple.") end,
    banana = function() print("🍌 This is a banana.") end,
    default = function() print("❓ Unknown fruit.") end
}
