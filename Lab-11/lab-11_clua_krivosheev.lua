function run()

	local a=1
	local b=3
	local c=30

	local x1, x2 = solve_eq(a, b, c)
	
	print("ax^2+bx+c=0")
	print(x1, x2)

	local  sin = sin_angle(c)

	print("SIN(angle)")
	print(sin)
end
