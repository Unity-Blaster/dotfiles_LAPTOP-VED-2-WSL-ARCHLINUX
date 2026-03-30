ansible --version
exit
ssh-copy-id -p 8022 -i ~/.ssh/id_ed25519.pub vedan@phone-ved-1
ssh vedan@phone-ved-1 -p 8022
exit
sudo whoami
ssh-keygen -t ed25519 -C "windows-control-node"
ssh-copy-id -i ~/.ssh/id_ed25519.pub vedan-server@laptop-ved-1
ls ~/.ssh/
ssh-keygen -t ed25519 -C "vedan-wsl-key"
ls -l ~/.ssh/id_ed25519.pub
mkdir -p ~/.ssh
chmod 700 ~/.ssh
ls -l ~/.ssh/
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -N ""
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -N ""
ssh-keygen -t ed25519 -C "vedan-wsl-key"
ssh-keygen -t ed25519 -C "vedan-wsl-key"
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -N ""
ls -l ~/.ssh/id_ed25519.pub
ssh-copy-id -i ~/.ssh/id_ed25519.pub vedan-server@laptop-ved-1
ssh-copy-id -i ~/.ssh/id_ed25519.pub vedan-server@laptop-ved-1
chsh -s $(which zsh)
chsh -s /usr/bin/zsh
exit
