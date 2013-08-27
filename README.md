Vagrant Symfony2
================

## Dependências

Essa configuração utiliza NFS portanto funciona apenas em Linux e Mac e depende da biblioteca `nfs-kernel-server`.

## Utilização

Clone o repositório para a sua máquina:

`git clone git@github.com:williancarminato/vagrant-symfony2.git`

Altere as configurações no arquivo VSConfiguration

```
# -*- mode: ruby -*-
# vi: set ft=ruby :

# O nome da box na sua máquina
$box_configuration = "precise32"

# O nome da sua vagrant box no VirtualBox
$box_name_configuration = "VagrantSymfony"

# Descomente a linha abaixo caso você precise buscar uma box não adicionada
# $box_url_configuration = "http://files.vagrantup.com/precise32.box"

# O ip de rede privado da sua vagrant box
$box_ip_configuration = "192.168.66.66"

# O ip de acesso na sua máquina host para a vagrant box
$box_hostport_configuration = 8030

# A quantidade de memória da vagrant box
$box_memory_configuration = 1024

# O diretório do symfony e a sua versão
# O nome do path aqui DEVE ser o mesmo do arquivo manifests/parameters.pp
$symfony_path_configuration = "sfproject"
$symfony_version_configuration = "2.3.4"
```

E também no arquivo manifests/parameters.pp

```
class parameters {
    # O hostname do seu projeto
    $hostname = 'sfproject.dev'

    # A pasta raiz do seu projeto, troque apenas se houver alterado a
    # $symfony_path_configuration
    $documentroot = '/var/www/sfproject/web'
}
```

Após alterar as configurações, suba a máquina com o:

`vagrant up`

Quando terminar, faça o apontamento na sua máquina host para o ip que você colocou de rede privado e o hostname do seu projeto. No caso da configuração default:

```
# /etc/hosts

# Vagrant
192.168.66.66   sfproject.dev
```

Por último abra o arquivo `app_dev.php` dentro da pasta web do Symfony e comente o bloqueio por ip.

Abra o navegador e acesse: `http://sfproject.dev/app_dev.php/`

E pronto, você tem uma VM Vagrant com o framework Symfony já instalado!
