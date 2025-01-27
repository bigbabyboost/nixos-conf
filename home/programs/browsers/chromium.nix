{
  config,
  pkgs,
  ...
}: let
  # Common extensions for both browsers
  commonExtensions = [
    "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
    "fnaicdffflnofjppbagibeoednhnbjhg" # floccus
    "aleakchihdccplidncghkekgioiakgal" # h264ify
    "icallnadddjmdinamnolclfjanhfoafe" # fastforward
    "eimadpbcbfnmbkopoojfekhnkhdbieeh" # dark reader
    "dhdgffkkebhmkfjojejmpbldmpobfkfo" # tampermonkey
    "ldgfbffkinooeloadekpmfoklnobpien" # raindrop
    "lckanjgmijmafbedllaakclkaicjfmnk" # clearurl's
    "ghbmnnjooekpmoecnnnilnnbdlolhkhi" # google doc's offline
  ];

  # Common command line flags for both browsers
  commonCommandLineArgs = [
    "--enable-features=AcceleratedVideoDecodeLinuxGL,AcceleratedVideoEncoder,CanvasOopRasterization,DefaultANGLEVulkan,EnableDrDc,SkiaGraphite,Vulkan,VulkanFromANGLE,PlatformHEVCDecoderSupport,UseMultiPlaneFormatForHardwareVideo,UseOzonePlatform,VaapiIgnoreDriverChecks"
    "--flag-switches-end"
    "--ozone-platform=wayland"
    "--disable-features=UseChromeOSDirectVideoDecoder"
    "--ignore-gpu-blocklist"
    "--enable-zero-copy"
    "--disable-gpu-driver-bug-workarounds"
    "--flag-switches-begin"
    "--enable-gpu-rasterization"
    "--enable-unsafe-webgpu"
    "--ozone-platform-hint=wayland"
  ];
in {
  # Configure Brave browser
  programs.brave = {
    enable = true;
    package = pkgs.brave;
    extensions = commonExtensions;
    commandLineArgs = commonCommandLineArgs;
  };

  # Configure Google Chrome browser
  programs.google-chrome = {
    enable = true;
    package = pkgs.google-chrome;
    commandLineArgs = commonCommandLineArgs;
  };
}
