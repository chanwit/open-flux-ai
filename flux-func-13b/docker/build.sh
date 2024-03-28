source ./VERSION

rm model.gguf || true
wget -qO model.gguf \
  https://huggingface.co/TheBloke/NexusRaven-V2-13B-GGUF/resolve/main/nexusraven-v2-13b.Q3_K_S.gguf

# Build CPU (avx2)
docker build \
--build-arg IMAGE=${IMAGE}-avx2 \
-t ghcr.io/kingdonb/flux-func-13b:${VERSION} .

docker push ghcr.io/kingdonb/flux-func-13b:${VERSION}

rm model.gguf || true
