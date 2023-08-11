-- meant for debugging, please do not use for whitelists!
-- supports.. most executors

local lp = game:GetService("Players").LocalPlayer
local http_request = http_request or (syn and syn.request) or httpget

local function gethwid(body)
	local result
	local parsed = game:GetService("HttpService"):JSONDecode(body)
	local headers = parsed
	for _, v in pairs(headers) do
		if _:lower():find("fingerprint") then
			result = {
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

-- usage
local hwid = gethwid(response.Body)
if hwid then
	return hwid
else
	lp:Kick("Failed to get HWID")
	return nil
end
