
local ttl = 3

local cli = redis.call('LRANGE', 'clients', 0, -1)
local now  = tonumber(redis.call('TIME')[1])

for i = 1, #cli do

	local ts = redis.call('GET', cli[i] .. '-tskrivosheev')

	local rem = true
	if ts ~= false then 
		if now < ts + ttl then rem = false end
	end

	if rem == true then
		redis.call('LREM', 'clients', 0, cli[i])
		
		redis.call('DEL', cli[i] .. '-tskrivosheev')
		redis.call('DEL', cli[i] .. '-xkrivosheev')
		redis.call('DEL', cli[i] .. '-ykrivosheev')
		redis.call('DEL', cli[i] .. '-btnkrivosheev')
		redis.call('DEL', cli[i] .. '-srkrivosheev')
		redis.call('DEL', cli[i] .. '-sgkrivosheev')
		redis.call('DEL', cli[i] .. '-sbkrivosheev')
	end

end

return cli
