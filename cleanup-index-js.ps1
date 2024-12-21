# Remove instances of specific strings in index.js and index.js.map
(Get-Content lib/index.js) -replace 'const{createRequire:createRequire}=await import("module");', '' | Set-Content lib/index.js
(Get-Content lib/index.js.map) -replace 'const{createRequire:createRequire}=await import("module");', '' | Set-Content lib/index.js.map

# Replace specific patterns in index.js and index.js.map
(Get-Content lib/index.js) -replace 'new \(require\("u" \+ "rl"\)\.URL\)\("file:" \+ __filename\)\.href', '"MLC_DUMMY_PATH"' | Set-Content lib/index.js
(Get-Content lib/index.js.map) -replace 'new \(require\("u" \+ "rl"\)\.URL\)\("file:" \+ __filename\)\.href', '"MLC_DUMMY_PATH"' | Set-Content lib/index.js.map

# Replace imports with dummy variables
(Get-Content lib/index.js) -replace 'import require\$\$3 from "perf_hooks";', 'const require$$3 = "MLC_DUMMY_REQUIRE_VAR"' | Set-Content lib/index.js
(Get-Content lib/index.js.map) -replace 'require\("perf_hooks"\)', '"MLC_DUMMY_REQUIRE_VAR"' | Set-Content lib/index.js.map

(Get-Content lib/index.js) -replace 'import require\$\$4 from "ws";', 'const require$$4 = "MLC_DUMMY_REQUIRE_VAR"' | Set-Content lib/index.js
(Get-Content lib/index.js.map) -replace 'require\("ws"\)', '"MLC_DUMMY_REQUIRE_VAR"' | Set-Content lib/index.js.map

# Cleanup backup files
Remove-Item lib/index.js.backup -ErrorAction SilentlyContinue
Remove-Item lib/index.js.map.backup -ErrorAction SilentlyContinue

Write-Host "Cleanup completed successfully!"
