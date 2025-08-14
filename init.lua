print(vim.fn.stdpath)
require("global")

local dev_env = os.getenv('NEO_DEVELOPMENT_ENV')
if dev_env == 'python' then
    require('python')
elseif dev_env == 'ruby' then
    require('ruby')
elseif dev_env == 'javascript' then
    require('javascript')
elseif dev_env == 'c' then
    require('c')
elseif dev_env ~= nil then
    print("We are in a special environment: " .. os.getenv('NEO_DEVELOPMENT_ENV'))
elseif dev_env == nil then
    require('standard')
else
    print("We just outright failed, smh")
end

