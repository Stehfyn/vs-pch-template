PROJECT_LOC = "%{wks.location}/src/%{prj.name}"
PROP_LOC = "%{wks.location}/shared/props"
TARGET_DIR = "%{wks.location}/build/bin/%{prj.name}/%{cfg.shortname}"
OBJ_DIR = "%{wks.location}/build/obj/%{prj.name}/%{cfg.shortname}"

PCH = "stdafx.h"
PCH_SRC = "%{wks.location}/src/sharedpch/stdafx.cpp"

MSBUILD_MACROS = (PROP_LOC .. "/msbuild-macros.props")
COMP_LAYER = (PROP_LOC .. "/compatibility-layer.props")

PCH_PDBDIR = (PROP_LOC .. "/pch-pdbdir.props")
PROJECT_PREBUILD = (PROP_LOC .. "/project-pre-buildstep.props")

workspace "vs-template-project"

	platforms {"x32", "x64"}
    configurations {"debug", "release"}
    language "C++"
    cppdialect "C++latest"
    system "windows"

	startproject "project1"
	
	importprops (MSBUILD_MACROS)

	project "sharedpch"
		location (PROJECT_LOC)
		kind "StaticLib"

		targetdir(TARGET_DIR)
		objdir(OBJ_DIR)

		importprops (COMP_LAYER)
		importprops (PCH_PDBDIR)
		importprops (PCH_POSTBUILD)

		pchheader (PCH)
        pchsource (PCH_SRC)

		files
		{
			(PROJECT_LOC .. "/**.h"),
			(PROJECT_LOC .. "/**.cpp")
		}

		flags
		{
			"MultiProcessorCompile"
		}

		filter "configurations:debug"
			defines {"DEBUG"}
			symbols "On"

		filter "configurations:release"
			defines {"NDEBUG"}
			optimize "On"

		filter "platforms:x32"
			architecture "x32"

		filter "platforms:x64"
			architecture "x64"

	project "project1"
		location (PROJECT_LOC)
		kind "ConsoleApp"

		targetdir(TARGET_DIR)
		objdir(OBJ_DIR)

		importprops (COMP_LAYER)
		importprops (PROJECT_PREBUILD)

		pchheader (PCH)
		pchsource (PCH_SRC)

		files
		{
			(PROJECT_LOC .. "/**.h"),
			(PROJECT_LOC .. "/**.hpp"),
			(PROJECT_LOC .. "/**.cpp")
		}

		links
		{
			"sharedpch"
		}

		flags
		{
			"MultiProcessorCompile"
		}

		filter "configurations:debug"
			defines {"DEBUG"}
			symbols "On"

		filter "configurations:release"
			defines {"NDEBUG"}
			optimize "On"

		filter "platforms:x32"
			architecture "x32"

		filter "platforms:x64"
			architecture "x64"

	project "project2"
		location (PROJECT_LOC)
		kind "ConsoleApp"

		targetdir(TARGET_DIR)
		objdir(OBJ_DIR)

		importprops (COMP_LAYER)
		importprops (PROJECT_PREBUILD)

		pchheader (PCH)
		pchsource (PCH_SRC)

		files
		{
			(PROJECT_LOC .. "/**.h"),
			(PROJECT_LOC .. "/**.hpp"),
			(PROJECT_LOC .. "/**.cpp")
		}

		links
		{
			"sharedpch"
		}

		flags
		{
			"MultiProcessorCompile"
		}

		filter "configurations:debug"
			defines {"DEBUG"}
			symbols "On"

		filter "configurations:release"
			defines {"NDEBUG"}
			optimize "On"

		filter "platforms:x32"
			architecture "x32"

		filter "platforms:x64"
			architecture "x64"
