-- meant for debugging, please do not use for whitelists!
-- supports.. most executors

local lp = game:GetService("Players").LocalPlayer
local http_request = http_request or (syn and syn.request) or httpget or request

local function gethwid(body)
	local result = { fingerprint = {}, accountid = {} }
	local parsed = game:GetService("HttpService"):JSONDecode(body)
	local headers = parsed
	for _, v in pairs(headers) do
		if _:lower():find("fingerprint") then
			result.fingerprint = {
				type = _,
				hwid = v
			}
		end
		if _:lower():find("user-identifier") then
			result.accountid = {
				type = _,
				hwid = v
			}
		end
	end
	return result
end

local response = http_request({
	Url = "http://httpbun.org/headers" -- faster alternative to httpbin
})
    
if response.StatusCode ~= 200 then
	lp:Kick("Failed to connect to httpbun / Request was denied.")
	return nil
end

return gethwid(response.Body)
