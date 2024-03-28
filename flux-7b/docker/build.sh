source ./VERSION

rm model.gguf || true
wget -qO model.gguf \
  https://huggingface.co/chanwit/flux-7b-v0.1-gguf/resolve/main/flux-7b-v0.1-Q5_K_M.gguf

docker build \
--build-arg IMAGE=${IMAGE} \
-t ghcr.io/kingdonb/flux-7b:${VERSION} .

docker push ghcr.io/kingdonb/flux-7b:${VERSION}

rm model.gguf || true
