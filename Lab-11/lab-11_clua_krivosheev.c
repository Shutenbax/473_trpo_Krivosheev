#include <math.h>
#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>

static int my_slove_eq(lua_State *l)
{
	float a = (float) luaL_checknumber(l, 1);
	float b = (float) luaL_checknumber(l, 2);
	float c = (float) luaL_checknumber(l, 3);

	float d = b * b -4.0f * a * c;
	if (d < 0)
	{
		lua_pushnil(l);
		lua_pushnil(l);
	}
	else if (d > 0)
	{
		float x1 = (-b + sqrt(d)) / (2.0f * a);
		float x2 = (-b - sqrt(d)) / (2.0f * a);
		lua_pushnumber(l, x1);
		lua_pushnumber(l, x2);
	}
	else
	{	
		float x = (-b + sqrt(d)) / (2.0f * a);
		lua_pushnumber(l, x);
		lua_pushnil(l);
	}
	

	return 2;
}

int main()
{
	lua_State *l = luaL_newstate();
	luaL_openlibs(l);
	
	luaL_loadfile(l, "lab-11_clua_krivosheev.lua");
	lua_pcall(l, 0, 0, 0);

	lua_pushcfunction(l, my_slove_eq);
	lua_setglobal(l, "solve_eq");

	lua_getglobal(l, "run");
	lua_pcall(l, 0, 0, 0);
	
	lua_close(l);
	return 0;

}
