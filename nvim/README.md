<div align="center">
  <img src="https://i.postimg.cc/zBwMk6sQ/Screenshot-2023-12-19-22-54-25-1366x768.png">
</div>
<hr>
<h4 align="center">
  <a href="#instalacion-del-proyecto-">Instalación</a>
  ·
  <a href="https://lazyvim.github.io/configuration">Configuración</a>
  ·
  <a href="https://lazyvim.github.io">Docs</a>
</h4>
El proyecto Neovim es un conjunto de configuraciones y complementos cuidadosamente seleccionados para mejorar la experiencia de usuario en Neovim. Diseñado pensando en la productividad y la personalización, este conjunto ofrece características avanzadas y atajos inteligentes para potenciar tu flujo de trabajo en el entorno de Neovim.

## Tabla de contenido :page_facing_up:

- [Funciones](#funciones-)
- [Requisitos](#requisitos-%EF%B8%8F)
    * [Instalación de requisitos](#instalacion-de-requisitos-%EF%B8%8F-)
    * [Instalación de Nerd Fonts](#instalaci%C3%B3n-de-nerd-fonts-)
- [Instalación del proyecto](#instalacion-del-proyecto-)
    * [Capturas de pantalla](#capturas-de-pantalla--)
- [Estructura de archivos](#estructura-de-archivos-)
- [Inspiración](#inspiraci%C3%B3n)
  
## Funciones ✨ 

- 🔥 Transforma tu Neovim 
- 🚀 Increíblemente rápido 
- 🧹 Configuración predeterminada sana para opciones, autocmds y mapas de teclas 
- 📦 Viene con una gran cantidad de complementos preconfigurados y listos para usar
- 💤 Personaliza y amplía fácilmente tu configuración con [lazy.nvim](https://github.com/folke/lazy.nvim) 

## Requisitos ⚡️ 

* Neovim \>= **0.9.0** 
* Git >= **2.19.0** 
* Fuente [Nerd Font](https://www.nerdfonts.com/) (v3.0 o superior) ***(opcional, pero necesaria para mostrar algunos iconos)***
* [lazygit](https://github.com/jesseduffield/lazygit) ***(optional)***
* Para el plugin telescope.nvim ***(opcional)***
  - **live grep**: [ripgrep](https://github.com/BurntSushi/ripgrep)
  - **find files**: [fd](https://github.com/sharkdp/fd)

* Un terminal que admita color verdadero y undercurl:
  * [kitty](https://github.com/kovidgoyal/kitty) ***(Linux & Macos)***
  * [wezterm](https://github.com/wez/wezterm) ***(Linux, Macos & Windows)***
  * [alacritty](https://github.com/alacritty/alacritty) ***(Linux, Macos & Windows)***
  * [iterm2](https://iterm2.com/) ***(Macos)***
<details>
 <summary> <h3 id="InstalacionRequisitos">Instalacion de Requisitos 🛠️ </h3></summary>
Aqui tienes los comandos de instalación para Linux/MacOs.
Se recomienda hacer una previa actulizacion antes de la instalacion, puedes hacer la actualizacion segun tu sistema operativo


* ### Ubuntu/Debian:
    ```bash
    sudo apt-get update
    sudo apt-get install neovim
    sudo apt-get install git
    sudo apt-get install lazygit 
    sudo apt-get install ripgrep 
    sudo apt-get install fd-find 
    sudo apt-get install fzf
    ```
* ### Fedora:
    ```bash
    sudo dnf install neovim
    sudo dng install git
    sudo dnf install lazygit 
    sudo dnf install ripgrep 
    sudo dnf install fd-find 
    sudo dnf install fzf
    ```
* ### Arch Linux:
    ```bash
    sudo pacman -S neovim
    sudo pacman -S git
    sudo pacman -S lazygit 
    sudo pacman -S ripgrep 
    sudo pacman -S fd 
    sudo pacman -S fzf
    ```

    sino tambien puede usar yay.
* ### Yay
    ```bash
    yay -S neovim
    yay -S git
    yay -S lazygit
    yay -S ripgrep
    yay -S fd
    yay -S fzf
    ```

    en caso de que no tengas yay instalado sigue los siguientes pasos:

1. Copia el repositorio:
    ```bash
    cd
    git clone https://aur.archlinux.org/yay.git
    ```
2. Entra en la carpeta de yay:
    ```bash
    cd yay
    ```
3. Instala yay:
    ```bash
    makepkg -si
    ```
4. Ahora si Instala los requerimientos con el comando:
    ```bash
    yay -S (Nombre Del programa o dependencia que necesitas)
    ```
* ### openSUSE:
    ```bash
    sudo zypper install neovim
    sudo zypper install git
    sudo zypper install lazygit 
    sudo zypper install ripgrep
    sudo zypper install fd
    sudo zypper install fzf
    ```
* ### macOS (usando Homebrew):
    ```bash
    brew install neovim
    brew install git
    brew install lazygit 
    brew install ripgrep 
    brew install fd
    brew installfzf
    ```
    Si aún no tienes Homebrew instalado, puedes instalarlo con:
1. Instala Homebrew
    ```bash
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    ```
2. Luego, puedes instalar los requerimientos o dependencias:
    ```bash
    brew install (nombre del programa o dependencia que deseas instalar)
    ```
    </details>
    Expande para poder ver los pasos de instalacion de los requisitos, en caso ya tengas lo requisitos instalados omite este mensaje.
<details>
 <summary> <h3>Instalación de Nerd Fonts 🗚</h3></summary>

Aqui tienes los comando necesarios para instalar las fuentes de [Nerd Font](https://www.nerdfonts.com/) , si quieres ver las fuentes que puedes instalar de manera personalizadas entra a la pagina de [Nerd Font](https://www.nerdfonts.com/) y escoge la fuente que deseas.
La fuente que se esta usando en los ejemplos es la fuente de [Iosevka Nerd Font](https://www.nerdfonts.com/).
1. Clona el repositorio de Nerd Fonts desde GitHub: 
    ```bash
    git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git
    ```
2. Cambia al directorio del repositorio:
    ```bash
    cd nerd-fonts
    ```
3. Ejecuta el script de instalación:
    ```bash
    ./install.sh
    ```
    </details>
    Expande para poder ver los pasos de instalacion de las fuentes, en caso ya tengas lo requisitos instalados omite este mensaje.

## Instalacion del proyecto 👨‍💻
El proyecto usa como base las configuraciones del proyecto [LazyVim](https://github.com/LazyVim/LazyVim)
* ### Linux/MacOs

Instalar el [LazyVim Starter](https://github.com/LazyVim/starter)

* Haz una copia de seguridad de tus archivos actuales de Neovim:

  ```bash
  mv ~/.config/nvim{,.bak}
  
  # Opcional pero recomendado
  mv ~/.local/share/nvim{,.bak}
  mv ~/.local/state/nvim{,.bak}
  mv ~/.cache/nvim{,.bak}
  ```

* Caso contrario que quieras eliminar los archivos para hacer una instalacion limpia:

  ```bash
  rm -rf ~/.config/nvim
  
  # Opcional pero recomendado
  rm -rf ~/.local/share/nvim
  rm -rf ~/.local/state/nvim
  rm -rf ~/.cache/nvim
  ```

* Clona el repositorio

  ```bash
  git clone https://github.com/andresfavio/nvim.git ~/.config/nvim
  ```

* Elimine la carpeta.git para poder agregarla a su propio repositorio más adelante

  ```bash
  rm -rf .git
  ```

* Inicia Neovim

  ```bash
  nvim
  ```

  Consulte la documentacion de [LazyVim](https://github.com/LazyVim/LazyVim) para poder personalizarlo a su gusto

  > Se recomienda ejecutar :checkhealth después de la instalación, esto para poder verificar si necesita instalar alguna dependencia extra.

<details>
 <summary> <h3>Capturas de pantalla 📸 </h3></summary>
    <p float="center">
<img alt="Onedark - dark" src="https://i.postimg.cc/0y6VSLzL/Screenshot-2023-12-20-13-59-19-1366x768.png">
<p float="left">
<img width="412" alt="Onedark - dark" src="https://i.postimg.cc/cHQ1XxJ2/Screenshot-2023-12-20-13-59-51-1366x768.png">
<img width="412" alt="Onedark - darker" src="https://i.postimg.cc/SQgbq2HV/Screenshot-2023-12-20-14-00-59-1366x768.png">
</div></p>
<p float="left">
<img width="412" alt="Onedark - cool" src="https://i.postimg.cc/9QWxfJT7/Screenshot-2023-12-20-14-01-47-1366x768.png">
<img width="412" alt="Onedark - deep" src="https://i.postimg.cc/hvmSfKkp/Screenshot-2023-12-20-14-17-40-1366x768.png">
</div></p>
<p float="left">
<img width="412" alt="Onedark - warm" src="https://i.postimg.cc/6pWXNVpH/Screenshot-2023-12-20-14-02-05-1366x768.png">
<img width="412" alt="Onedark - warmer" src="https://i.postimg.cc/8PkKpZLr/Screenshot-2023-12-20-14-02-17-1366x768.png">
</div></p>
<p float="left">
<img width="412" alt="Onedark - warm" src="https://i.postimg.cc/kXDQYzxw/Screenshot-2023-12-20-14-03-52-1366x768.png">
<img width="412" alt="Onedark - warmer" src="https://i.postimg.cc/MG0VjSSZ/Screenshot-2023-12-20-14-05-44-1366x768.png">
</div></p>
</details>

## Estructura de archivos 📂 

```bash
~/.config/nvim
├──init.lua
├──lua
│  ├──andres
│  │  ├──discipline.lua
│  │  └──utils.lua
│  ├──config
│  │  ├──autocmds.lua
│  │  ├──keymaps.lua
│  │  ├──lazy.lua
│  │  └──options.lua
│  ├──plugins
│  │  ├──coding.lua
│  │  ├──colorscheme.lua
│  │  ├──disable.lua
│  │  ├──editor.lua
│  │  └──ui.lua
│  └──util
│     └──debug.lua
└──README.md
```

## Inspiración

* [LazyVim](https://www.lazyvim.org/)
* [Crafzdog](https://www.youtube.com/watch?v=fFHlfbKVi30&pp=ygUJZGV2YXNsaWZl)
* [Josean-Dev](https://github.com/josean-dev/dev-environment-files)
* [Gentleman Programming](https://www.youtube.com/@GentlemanProgramming)
