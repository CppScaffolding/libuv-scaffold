-- scaffold geniefile for libuv

libuv_script = path.getabsolute(path.getdirectory(_SCRIPT))
libuv_root = path.join(libuv_script, "libuv")

libuv_includedirs = {
	path.join(libuv_script, "config"),
	libuv_root,
}

libuv_libdirs = {}
libuv_links = {}
libuv_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { libuv_includedirs }
	end,

	_add_defines = function()
		defines { libuv_defines }
	end,

	_add_libdirs = function()
		libdirs { libuv_libdirs }
	end,

	_add_external_links = function()
		links { libuv_links }
	end,

	_add_self_links = function()
		links { "libuv" }
	end,

	_create_projects = function()

project "libuv"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		libuv_includedirs,
	}

	defines {}

	files {
		path.join(libuv_script, "config", "**.h"),
		path.join(libuv_root, "**.h"),
		path.join(libuv_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
