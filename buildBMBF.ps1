# Builds a .zip file for loading with BMBF
$NDKPath = Get-Content $PSScriptRoot/ndkpath.txt

$buildScript = "$NDKPath/build/ndk-build"
if (-not ($PSVersionTable.PSEdition -eq "Core")) {
    $buildScript += ".cmd"
}

& $buildScript NDK_PROJECT_PATH=$PSScriptRoot APP_BUILD_SCRIPT=$PSScriptRoot/Android.mk NDK_APPLICATION_MK=$PSScriptRoot/Application.mk
Compress-Archive -Force -Path "./libs/arm64-v8a/libcustomui-test.so","./bmbfmod.json","./extern/libbeatsaber-hook_0_7_1.so","./extern/libbs-utils.so","./extern/libcodegen_0_2_6.so","./extern/libcustom-types_0_2_1.so" -DestinationPath "./customui-test.zip"
