# adguard_hook
clang -shared -undefined dynamic_lookup -o /Applications/Adguard.app/Contents/MacOS/libAdguard.dylib AdGuardHook.m
optool install -c load -p @executable_path/libAdguard.dylib -t /Applications/Adguard.app/Contents/MacOS/Adguard
cp libsubstitute.dylib /usr/local/lib/libsubstitute.0.dylib
