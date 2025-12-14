project "JoltPhysics"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "off"
    
    targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
    objdir    ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "Jolt/**.h",
        "Jolt/**.inl",
        "Jolt/**.cpp",
    }

    removefiles
    {
        "Samples/**",
        "TestFramework/**",
        "UnitTests/**",
        "HelloWorld/**",
        "JoltViewer/**",
        "PerformanceTest/**",
        "Docs/**",
        "Build/**",
        "Assets/**",
    }

    includedirs
    {
        "."
    }

    filter "system:windows"
        systemversion "latest"
        defines
        {
            "JPH_PLATFORM_WINDOWS",
            "JPH_COMPILER_MSVC",
            "JPH_FLOATING_POINT_EXCEPTIONS_DISABLED"
        }
        buildoptions
        {
            "/EHsc",
            "/bigobj",
            "/utf-8"
        }

    filter "configurations:Debug"
        defines { "JPH_DEBUG", "JPH_ENABLE_ASSERTS" }
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        defines { "JPH_RELEASE" }
        runtime "Release"
        optimize "on"

    filter "configurations:Dist"
        defines { "JPH_DIST" }
        runtime "Release"
        optimize "on"
