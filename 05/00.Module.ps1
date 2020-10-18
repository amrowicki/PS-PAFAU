# Tworzymy pusty moduł w którym będzie przechowywana definicja roli
$modulePath = Join-Path $env:ProgramFiles "WindowsPowerShell\Modules\spooler_conf"
New-Item -ItemType Directory -Path $modulePath

# Dla porządku tworzymy psm1 i psd1
New-Item -ItemType File -Path (Join-Path $modulePath "spooler_conf.psm1")
New-ModuleManifest -Path (Join-Path $modulePath "spooler_conf.psd1") -RootModule "spooler_conf.psm1"