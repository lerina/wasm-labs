echo "rm -fr www"
rm -fr www

echo "mkdir www"
mkdir www

echo "cargo +nightly build --target wasm32-unknown-unknown"
cargo +nightly build --target wasm32-unknown-unknown

echo "wasm-bindgen --target web --no-typescript --out-dir ./www target/wasm32-unknown-unknown/debug/gen_wasm.wasm"
wasm-bindgen --target web --no-typescript --out-dir ./www target/wasm32-unknown-unknown/debug/gen_wasm.wasm

#ls -lh www/gen_wasm_bg.wasm
echo "wasm-gc ./www/gen_wasm_bg.wasm"
wasm-gc ./www/gen_wasm_bg.wasm
ls -lh www/gen_wasm_bg.wasm

echo "cp bckindex.html www/index.html"
cp bckindex.html www/index.html

## https://github.com/thecoshman/http
echo "http ./www"
http ./www

## https://github.com/TheWaWaR/simple-http-server
#echo "simple-http-server ./www"
#simple-http-server ./www

## https://github.com/svenstaro/miniserve
#echo "miniserve ./www"
#miniserve ./www


