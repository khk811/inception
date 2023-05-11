# !/bin/sh

# curl로 mkcert 다운로드
curl -s https://api.github.com/repos/FiloSottile/mkcert/releases/latest | grep browser_download_url | grep linux-amd64 | cut -d '"' -f 4 | wget -qi -

# 다운로드 받은 mkcert 파일을 binary 폴더로 옮기고 권한 수정함
mv mkcert-v*-linux-amd64 mkcert && chmod a+x mkcert && sudo mv mkcert /usr/local/bin/

# mkcert install
sudo mkcert -install

# mkcert로 인증서를 발급
sudo mkcert ::443 hyunkkim.42.fr

sudo mv *.pem /etc/nginx/
