require("global")

local dev_env = os.getenv('NEO_DEVELOPMENT_ENV')
if dev_env ~= nil then
    print("We are in a special environment: " .. os.getenv('NEO_DEVELOPMENT_ENV'))
elseif dev_env == nil then
    require('standard')
else
    print("We just outright failed, smh")
end

